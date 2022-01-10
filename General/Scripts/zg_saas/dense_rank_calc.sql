
-- select @rn:=coalesce(@rn, 0)+1

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
) b