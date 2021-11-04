            select staff_login_name
                , staff_name
                , group_concat(distinct category) as category
                , date_format(max(etl_date), '%Y-%m-%d %H:%i:%s') as etl_date
                , max(if(date_range_group = 'day' and left(category, 3) = 'rtm', prepared_value, null)) as today_value
                , max(if(date_range_group = 'day' and left(category, 3) = 'rtm', prepared_rank, null)) as today_rank
                , max(if(date_range_group = 'day' and left(category, 3) = 't1l', prepared_value, null)) as last_work_day_value
                , max(if(date_range_group = 'day' and left(category, 3) = 't1l', prepared_rank, null)) as last_work_day_rank
                , max(if(date_range_group = 'week' and left(category, 3)  = 'rtm', prepared_value, null)) as current_week_value
                , max(if(date_range_group = 'week' and left(category, 3)  = 'rtm', prepared_rank, null)) as current_week_rank
                , max(if(date_range_group = 'week' and left(category, 3) = 't1l', prepared_value, null)) as last_week_value
                , max(if(date_range_group = 'week' and left(category, 3) = 't1l', prepared_rank, null)) as last_week_rank
                , max(if(date_range_group = 'month' and left(category, 3)  = 'rtm', prepared_value, null)) as current_month_value
                , max(if(date_range_group = 'month' and left(category, 3)  = 'rtm', prepared_rank, null)) as current_month_rank
                , max(if(date_range_group = 'month' and left(category, 3) = 't1l', prepared_value, null)) as last_month_value
                , max(if(date_range_group = 'month' and left(category, 3) = 't1l', prepared_rank, null)) as last_month_rank
            from saas_report.rpt_srm_v2_presonal_performance
            where substr(category, 5) = (
                case 'sales'
                    when 'sales' then 'sales'
                    when 'profit' then 'profit'
                    when 'cf_b1OweCompany' then 'b1_company'
                    when 'cf_companyOweB1' then 'company_b1'
                    when 'cf_t1Subtract' then 'subtract_amount'
                    else null
                end
            )
            group by staff_login_name, staff_name
            order by today_value desc


;


select find_in_set('4', '0,1,2,1.1,1.1,4') ;;



select staff_login_name
	, curr_day_name
	, curr_day_rank
	, coalesce(@rn := @rn + if(@val = curr_day_value, 0, 1), 0) as calc_day_rank
	, coalesce(@val := curr_day_value) as curr_day_value 
from (
	select staff_login_name, curr_day_name, curr_day_value, curr_day_rank
	from saas_report.rpt_srm_v2_presonal_performance_merged
	order by curr_day_value desc
) a, (
	select @rn := 0, @val := null
) b;


select acci_domain

from saas_report.srm_supplier_ad ad
where is_delete  = 'N' and tenant_code = 'ZG'
and exists ( select 1 from saas_report.rpt_srm_v2_merchants_supplier_releation where staff_login_name = ad.acci_domain )
group by acci_domain;



select supplier_id
from rpt_srm_v2_supplier_owed_amount_rtm
group by supplier_id