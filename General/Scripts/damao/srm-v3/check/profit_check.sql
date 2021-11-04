SELECT ROUND(COALESCE(SUM(plan_weight), 0), 3) AS totalSales, 
    ROUND(COALESCE(SUM(estimated_profit), 0), 2) AS sumProfit
FROM saas_report.rpt_srm_v2_merchants_purchase_detail_rtm
WHERE order_date BETWEEN "2021-09-01 00:00:00" AND "2021-09-26 23:59:59"
AND staff_login_name IN ("shuangqin.pi", "benqiang.zhang", "chunhui.luo", "lizhihui", null);




SELECT ROUND(COALESCE(SUM(plan_weight), 0), 3) AS totalSales, 
    ROUND(COALESCE(SUM(estimated_profit), 0), 2) AS sumProfit
FROM saas_report.rpt_srm_v2_merchants_purchase_detail_rtm rtm
WHERE order_date BETWEEN "2021-09-01 00:00:00" AND "2021-09-26 23:59:59"
AND staff_login_name IN ("shuangqin.pi", "benqiang.zhang", "chunhui.luo", "lizhihui", null)
and exists (
    select 1 -- 多个供应商的话则合并
    from saas_report.rpt_srm_v2_merchants_supplier_releation
    where region_name = '电商招商'
    and rtm.supplier_id = supplier_id 
);

SELECT ROUND(COALESCE(SUM(price), 0), 2) AS advertiseIncome
FROM saas_report.srm_supplier_ad
WHERE tenant_code = 'ZG'
AND is_delete = 'N';

select supplier_id
    , supplier
    , current_plan_weight
    , previous_plan_weight
    , estimated_profit
    , plan_weight_m2m
    , (@rn := @rn + 1) as rn
from (
    select a.supplier_id
        , a.supplier_fullname as supplier
        , coalesce(b.current_plan_weight, 0) as current_plan_weight
        , coalesce(b.previous_plan_weight, 0) as previous_plan_weight
        , coalesce(b.estimated_profit, 0) as estimated_profit
        -- 处理分母为0的情况，(current_plan_weight - previous_plan_weight) / previous_plan_weight
        , if(b.previous_plan_weight > 0, concat(round((coalesce(b.current_plan_weight, 0) - coalesce(b.previous_plan_weight, 0)) / coalesce(b.previous_plan_weight, 0) * 100, 3), '%'), '-') as plan_weight_m2m
    from (
        select supplier_id, group_concat(distinct supplier_fullname) as supplier_fullname -- 多个供应商的话则合并
        from saas_report.rpt_srm_v2_merchants_supplier_releation
        where region_name = '电商招商'
        group by supplier_id
    ) a
    left join (
        select supplier_id
            , coalesce(sum(c.current_plan_weight), 0) as current_plan_weight
            , coalesce(sum(c.previous_plan_weight), 0) as previous_plan_weight
            , coalesce(sum(c.estimated_profit), 0) as estimated_profit
        from (
            select 'rtm' as cate
                , supplier_id
                , plan_weight as current_plan_weight
                , null as previous_plan_weight
                , estimated_profit
            from rpt_srm_v2_merchants_purchase_detail_rtm 
            where
                order_date between "2021-09-01 00:00:00" and "2021-09-30 23:59:59"
                and staff_login_name in ("shuangqin.pi", "benqiang.zhang", "chunhui.luo", "lizhihui", null)  
            
            union all
            select 't1l' as cate
                , supplier_id
                , null as current_plan_weight
                , plan_weight as previous_plan_weight
                , null as estimated_profit
            from rpt_srm_v2_merchants_purchase_detail_log  
            where
                order_date between "2021-08-01 00:00:00" and "2021-08-31 23:59:59"
                and staff_login_name in ("shuangqin.pi", "benqiang.zhang", "chunhui.luo", "lizhihui", null)
            
        ) c
        group by supplier_id
    ) b
    on a.supplier_id = b.supplier_id
) x, (
    select @rn := 0
) y;



select 'rtm' as cate
    , supplier_id
    , plan_weight as current_plan_weight
    , null as previous_plan_weight
    , estimated_profit
from rpt_srm_v2_merchants_purchase_detail_rtm 
where order_date between "2021-09-01 00:00:00" and "2021-09-30 23:59:59"
and staff_login_name in ("shuangqin.pi", "benqiang.zhang", "chunhui.luo", "lizhihui", null)  
-- and supplier_id = 10011222
;

select sum(estimated_profit) from (
	select 'rtm' as cate
	    , supplier_id
	    , plan_weight as current_plan_weight
	    , null as previous_plan_weight
	    , estimated_profit
	from rpt_srm_v2_merchants_purchase_detail_rtm 
	where order_date between "2021-09-01 00:00:00" and "2021-09-30 23:59:59"
	and staff_login_name in ("shuangqin.pi", "benqiang.zhang", "chunhui.luo", "lizhihui", null)  
	-- and supplier_id = 10011222
) x;