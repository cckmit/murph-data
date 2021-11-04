select x.supplier_id
	, group_concat(distinct supplier_fullname) as supplier_fullname
	, group_concat(distinct staff_login_name) as staff_set
	, group_concat(distinct added_time) as added_time	
	, group_concat(distinct status) as status
	, group_concat(distinct new_supplier) as new_supplier
	, coalesce(round(sum(current_plan_weight), 3), 0) as current_plan_weight
	, coalesce(round(sum(previous_plan_weight), 3), 0) as previous_plan_weight
	, coalesce(round(sum(estimated_profit), 3), 0) as estimated_profit
	, coalesce(round(sum(ad_incoming), 3), 0) as ad_incoming
	, coalesce(round(sum(previous_crash_flow), 3), 0) as previous_crash_flow
	, coalesce(round(sum(profit_per_ton), 3), 0) as profit_per_ton
	, count(distinct x.supplier_id) as cnt
from (
    select supplier_id
        , supplier_code
        , supplier_fullname
        , staff_login_name
        , if(first_status = 't', '已启用', '已停用') as status
        , date_format(added_time, '%Y-%m-%d %H:%i:%s') as added_time
        , if(added_time > date_sub(current_date(), interval (60 - 1) day) and first_status = 'T' and second_status = 'T', '是', '否') as new_supplier
    from saas_report.rpt_srm_v2_merchants_supplier_releation
    where supplier_id is not null 
    and region_name = '电商招商'
) x 
left join (
	select 'rtm' as cate
	    , supplier_id
	    , order_date
	    , plan_weight as current_plan_weight
	    , null as previous_plan_weight
	    , estimated_profit
        , null as ad_incoming
        , null as previous_crash_flow
        , null as profit_per_ton
	from rpt_srm_v2_merchants_purchase_detail_rtm 
	where supplier_id is not null
	and order_date > date_format(now(), '%Y-%m-01')
	union all
	select 't1l' as cate
	    , supplier_id
	    , order_date
	    , null as current_plan_weight
	    , plan_weight as previous_plan_weight
	    , null as estimated_profit
        , null as ad_incoming
        , null as previous_crash_flow
        , null as profit_per_ton
	from rpt_srm_v2_merchants_purchase_detail_log  
	where supplier_id is not null
	and order_date > date_format(now(), '%Y-%m-01')
) y
on x.supplier_id = y.supplier_id 
group by x.supplier_id
-- having count(distinct x.supplier_id) > 1
;

select * 
from scm.account_info;

SELECT COUNT(DISTINCT supplier_id) AS supplierTotal
    , COUNT(DISTINCT IF(first_status = 'T', supplier_id, NULL)) AS supplierEnableV1
    , COUNT(DISTINCT IF(first_status = 'T' and second_status = 'T', supplier_id, NULL)) AS supplierEnableV2
    , NULL AS totalSales
    , NULL AS sumProfit
    , NULL AS advertise
FROM saas_report.rpt_srm_v2_merchants_supplier_releation ;


select left('abc', length('abc') - 1);


select a.staff_login_name
    , coalesce(round(sum(price), 3), 0) as calc_valueW
from (
    select staff_login_name, group_concat(distinct staff_name) as staff_name
    from saas_report.rpt_srm_v2_merchants_supplier_releation
    group by staff_login_name
)  a
left join (
	select acci_domain, deal_date, price
	from saas_report.srm_supplier_ad
    where is_delete  = 'N'
	and tenant_code = 'ZG'
) b
on a.staff_login_name = b.acci_domain 
group by a.staff_login_name;


select tree.dept_code, tree.dept_parent_dept_code, tree.dept_name
from oa_workflow.hr_department tree
where tree.dept_name = '电商招商'
union all 
select tree.dept_code, tree.dept_parent_dept_code, tree.dept_name
from oa_workflow.hr_department tree
where tree.dept_parent_dept_cod e= ( 
	select dept_code from oa_workflow.hr_department where dept_name = '电商招商' limit 1
)