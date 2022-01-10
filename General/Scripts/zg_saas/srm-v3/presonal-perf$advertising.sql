select acci_domain as staff_login_name
	, deal_date
	, price
	, null as current_week_value
	, null as current_week_rank
	, null as last_week_value
	, null as last_week_rank
	, null as current_month_value
	, null as current_month_rank
	, null as last_month_value
	, null as last_month_rank
	, null as current_year_value
	, null as current_year_rank	
from saas_report.srm_supplier_ad
where is_delete  = 'N'
and tenant_code = 'ZG';

select concat(year(now()), '-01-01'), concat(year(now()), '-12-31 23:59:59'), 