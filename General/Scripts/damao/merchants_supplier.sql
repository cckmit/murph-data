select * 
from saas_report.rpt_srm_v2_merchants_supplier_releation
where supplier_id in (10024012, 10003792, 10004338, 10004338);


select supplier_id
    , supplier_code
    , supplier_fullname
    , staff_login_name
    , if(first_status = 't', '已启用', '已停用') as status
    , date_format(added_time, '%Y-%m-%d %H:%i:%s') as added_time
    , if(added_time > date_sub(current_date(), interval (60 - 1) day) and first_status = 'T' and second_status = 'T', '是', '否') as new_supplier
from saas_report.rpt_srm_v2_merchants_supplier_releation
where supplier_id is not null 
and staff_login_name in ( 'fei.he' )
and supplier_fullname = '冷钢武汉工贸有限公司';


select * 
from saas_report.rpt_srm_v2_supplier_owed_amount_rtm
where biz_date = '2021-10-11' and '2021-10-17 23:59:59';
;

select find_in_set('2021-10-11', '2021-10-11') ;

select * 
from saas_report.rpt_srm_v2_supplier_owed_amount_rtm
where find_in_set(date_format(biz_date, '%Y-%m-%d'), '2021-10-11') > 0
;


select supplier_id 
    , supplier_fullname as supplier
    , subtract_amount
    , coalesce(subtract_amount, '-') as subtract_amount_txt
from (
    select a.supplier_id, a.supplier_fullname, round(sum(b.subtract_amount) / 10000, 3) as subtract_amount
    from (
        select supplier_id, group_concat(distinct supplier_fullname) as supplier_fullname    -- 多个供应商的话则合并
        from saas_report.rpt_srm_v2_merchants_supplier_releation
        where
            supplier_id is not null

                and staff_login_name in (    "zq",
    "fei.he",
    "lizhihui",
    "jieyi.chen",
    "huanxi.pang1",
    "LIJUAN.YU",
    "dehua.liu")


        group by supplier_id
    ) a
    left join (
        select supplier_id, subtract_amount
        from saas_report.rpt_srm_v2_supplier_owed_amount_rtm soa

            -- 仅查询工作日数据
            where find_in_set(date_format(biz_date, '%Y-%m-%d'), "2021-10-11") > 0

        -- 过滤招商信息
        and exists (
            select 1 
            from saas_report.rpt_srm_v2_merchants_supplier_releation
            where supplier_id = soa.supplier_id 
                and staff_login_name in (    "zq",
    "fei.he",
    "lizhihui",
    "jieyi.chen",
    "huanxi.pang1",
    "LIJUAN.YU",
    "dehua.liu") 
        )
    ) b
    on a.supplier_id = b.supplier_id
    group by a.supplier_id, a.supplier_fullname
) x
order by subtract_amount desc


