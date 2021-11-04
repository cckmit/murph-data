set @label:='current_week';



	select query_start,
        query_end,
        last_work_date,
        date_format(date_sub(current_date(), interval 1 day), '%Y-%m-%d') as yesterday,
        case @label 
            when 'current_week' then 'current_week'
            when 'current_month' then 'current_month'
            else 'today'
        end as label,
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
            when 'current_week' then work_date_set_of_week
            when 'current_month' then work_date_set_of_month
            else null
        end as work_date_set
    from (
        select max(query_start) as query_start, 
            max(query_end) as query_end,
            max(if(date_str = current_date(), date_format(last_work_date, '%Y-%m-%d'), null)) as last_work_date,
            group_concat(concat(date_str)) as work_date_set_of_month,
            group_concat(if(week(date_str, 1) = week(current_date(), 1), date_str, null)) work_date_set_of_week
        from saas_report.dim_date x
        left join (
            select date_format(now(), '%Y-%m-01') as query_start, date_format(last_day(current_date()), '%Y-%m-%d') as query_end
        ) y
        on 1 = 1
        where date_str between y.query_start and y.query_end
        and work_day = 1
    ) b