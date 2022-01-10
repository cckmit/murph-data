set @label:='current_week';

select @label as label,
    case @label 
        when 'current_week' then concat_ws(' ', date_sub(current_date(), interval weekday(current_date()) day), '00:00:00')
        when 'current_month' then date_format(now(), '%Y-%m-01 00:00:00')
        else concat_ws(' ', current_date(), '00:00:00')
    end as nature_start,
    case @label
        when 'current_week' then concat_ws(' ', date_add(current_date(), interval (6 - weekday(current_date())) day), '23:59:59')
        when 'current_month' then concat_ws(' ',last_day( current_date()), '23:59:59')
        else concat_ws(' ', current_date(), '23:59:59')
    end as nature_end,
    case @label
        when 'current_week' then concat_ws(' ', date_add(current_date(), interval (6 - weekday(current_date())) day), '23:59:59')
        when 'current_month' then concat_ws(' ',last_day( current_date()), '23:59:59')
        else concat_ws(' ', current_date(), '23:59:59')
    end as nature_end,
    case @label
        when 'current_week' then valid_week_date_array
        when 'current_month' then valid_month_date_array
        else null
    end as valid_date_array
from (
	select concat('[', group_concat(concat('"', date_str, '"')), ']') as valid_month_date_array,
		concat('[', group_concat(if(week_ofyear = (week(current_date(), 0) + 1), concat('"', date_str, '"'), null)), ']') valid_week_date_array
	from saas_report.dim_date
	where date_str between date_format(now(), '%Y-%m-01') and last_day(current_date())
	and work_day = 1
) d
;