select x.label
	, y.staff_login_name
	, y.staff_name
	, coalesce(case x.label
		when 'current_week' then y.current_week_value
		when 'previous_week' then y.previous_week_value
		when 'current_month' then y.current_month_value
		when 'previous_month' then y.previous_month_value
		when 'current_year' then y.current_year_value
		else null
	end, 0) as prepared_value
from (
	select 'current_week' as label union all select 'previous_week' union all select 'current_month' union all select 'previous_month' union all select 'current_year'
) x, (
	select a.staff_login_name
		, a.staff_name
		, round(sum(if(c.deal_date between b.current_week_start and b.current_week_end, price, null)), 3) as current_week_value
		, round(sum(if(c.deal_date between b.previous_week_start and b.previous_week_start, price, null)), 3) as previous_week_value
		, round(sum(if(c.deal_date between b.current_month_start and b.current_month_end, price, null)), 3) as current_month_value
		, round(sum(if(c.deal_date between b.previous_month_start and b.previous_month_end, price, null)), 3) as previous_month_value
		, round(sum(if(c.deal_date between b.current_year_start and b.current_year_end, price, null)), 3) as current_year_value
	from (
		select staff_login_name, group_concat(distinct staff_name) as staff_name 
		from saas_report.rpt_srm_v2_merchants_supplier_releation 
		group by staff_login_name
	) a 
	left join (
		select concat(left(replace(week_ofyear_period, '/', '-'), 10), ' 00:00:00') as current_week_start
		    , concat(right(replace(week_ofyear_period, '/', '-'), 10), ' 23:59:59') as current_week_end
		    , concat(left(replace(last_week_ofyear_period, '/', '-'), 10), ' 00:00:00') as previous_week_start
		    , concat(right(replace(last_week_ofyear_period, '/', '-'), 10), ' 23:59:59') as previous_week_end
		    , date_format(now(), '%Y-%m-01 00:00:00') as current_month_start
		    , concat(last_day(now()), ' 23:59:59') as current_month_end
		    , date_format(date_sub(current_date(), interval 1 month), '%Y-%m-01 00:00:00') as previous_month_start
		    , concat(last_day(date_sub(current_date(), interval 1 month)), ' 23:59:59') as previous_month_end
		    , concat(year(now()), '-01-01 00:00:00') as current_year_start
		    , concat(year(now()), '-12-31 23:59:59') as current_year_end
		from saas_report.dim_date a
		where date_str = current_date()
	) b
	on 1 = 1
	left join (
		select acci_domain, deal_date, price 
		from saas_report.srm_supplier_ad as x 
		where is_delete  = 'N' 
		and tenant_code = 'ZG'
		and deal_date > date_sub(current_date(), interval 70 day) 
		and exists (select 1 from saas_report.srm_supplier_ad where acci_domain = x.acci_domain)
	) c
	on a.staff_login_name = c.acci_domain
	group by a.staff_login_name, a.staff_name
) y, (
	select @current_week_rank := 0, @current_week_temp := null
		, @previous_week_rank := 0, @previous_week_temp := null
		, @current_month_rank := 0, @current_month_temp := null
		, @previous_month_rank := 0, @previous_month_temp := null
		, @current_year_rank := 0, @current_year_temp := null
) z
;
