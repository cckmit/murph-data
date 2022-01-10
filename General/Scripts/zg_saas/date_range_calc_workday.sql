-- date_range_calc_nature.sql

select max(if(date_str = current_date(), date_format(last_work_date, '%Y-%m-%d'), null)), group_concat(date_str), group_concat(if(week_ofyear = (week(current_date(), 0) + 1), concat('"', date_str, '"'), null)) /** max(if(date_str = current_date(), week_ofyear_period, null)) as week_flag,  **/
from saas_report.dim_date
where date_str between date_format(now(), '%Y-%m-01') and last_day(current_date())
and work_day = 1;


select date_str
from saas_report.dim_date
where week(date_str, 1) = week(current_date(), 1)
and work_day = 1
and date_str between date_format(now(), '%Y-%m-01') and last_day(current_date());

select *, week(current_date()) 
from saas_report.dim_date
where date_str between date_format(now(), '%Y-%m-01') and last_day(current_date())
and work_day = 1;

select week('2021-01-01', 0) + 1;

select json_search('["2021-09-22","2021-09-23","2021-09-24","2021-09-26"]', 'one', '2021-08-22') is null;


select max(if(date_str = current_date(), date_format(last_work_date, '%Y-%m-%d'), null)) as last_work_date,
    group_concat(concat(date_str)) as valid_month_date_array,
    group_concat(if(week_ofyear = (week(current_date(), 0) + 1), date_str, null)) valid_week_date_array
from saas_report.dim_date
where date_str between date_format(now(), '%Y-%m-01') and last_day(current_date())
and work_day = 1;

select date_format(last_day(current_date()), '%Y-%m-%d') as query_end,
    max(if(date_str = current_date(), date_format(last_work_date, '%Y-%m-%d'), null)) as last_work_date,
    group_concat(concat(date_str)) as work_month_range,
    group_concat(if(week_ofyear = (week(current_date(), 0) + 1), date_str, null)) work_week_range
from saas_report.dim_date x
join (
    select date_format(now(), '%Y-%m-01') as query_start,
        date_format(last_day(current_date()), '%Y-%m-%d') as query_end
) y
on 1 = 1
where date_str between y.query_start and y.query_end
and work_day = 1;

/** release **/
set @label:='near_2_week';

    select today,
        yesterday,
        last_work_date,
        case @label
            when 'current_week' then 'current_week'
            when 'current_month' then 'current_month'
            else 'today'
        end as label,
        case @label
            when 'current_week' then concat_ws(' ', left(current_week_year_period, 10), '00:00:00')
            when 'near_2_week' then concat_ws(' ', date_sub(left(current_week_year_period, 10), interval 1 week), '00:00:00')
            when 'current_month' then date_format(now(), '%Y-%m-01 00:00:00')
            else concat_ws(' ', today, '00:00:00')
        end as nature_current_start,
        case @label
            when 'current_week' then concat_ws(' ', right(current_week_year_period, 10), '23:59:59')
            when 'near_2_week' then concat_ws(' ', right(current_week_year_period, 10), '23:59:59')
            when 'current_month' then concat_ws(' ',last_day(current_date()), '23:59:59')
            else concat_ws(' ', today, '23:59:59')
        end as nature_current_end,
        case @label
            when 'current_week' then concat_ws(' ', left(previous_week_year_period, 10), '00:00:00')
            when 'near_2_week' then concat_ws(' ', date_sub(left(previous_week_year_period, 10), interval 2 week), '00:00:00')
            when 'current_month' then date_format(previous_month_today, '%Y-%m-01 00:00:00')
            else concat_ws(' ', yesterday, '00:00:00')
        end as nature_previous_start,
        case @label
            when 'current_week' then concat_ws(' ', right(previous_week_year_period, 10), '23:59:59')
            when 'near_2_week' then concat_ws(' ', date_sub(right(previous_week_year_period, 10), interval 1 week), '23:59:59')
            when 'current_month' then concat_ws(' ',last_day(previous_month_today), '23:59:59')
            else concat_ws(' ', yesterday, '23:59:59')
        end as nature_previous_end,
        case @label
            when 'current_week' then work_date_set_of_week
            when 'near_2_week' then work_date_set_of_near2week
            when 'current_month' then work_date_set_of_month
            else null
        end as work_date_set
    from (
        select date_sub(current_date(), interval 1 month) as previous_month_today,
            date_format(date_sub(current_date(), interval if(@label= 'yesterday', 1, 0) day), '%Y-%m-%d') as today,
            date_format(date_sub(current_date(), interval if(@label= 'yesterday', 2, 1) day), '%Y-%m-%d') as yesterday,
            max(if(date_str = current_date(), date_format(last_work_date, '%Y-%m-%d'), null)) as last_work_date,
            max(if(date_str = current_date(), replace(week_ofyear_period, '/', '-'), null)) as current_week_year_period,
            max(if(date_str = current_date(), replace(last_week_ofyear_period, '/', '-'), null)) as previous_week_year_period,
            group_concat(date_str) as work_date_set_of_month,
            group_concat(if(week(date_str, 1) = week(current_date(), 1), date_str, null)) work_date_set_of_week,
            group_concat(if(week(date_str, 1) = week(now(), 1) or week(date_str, 1) = (week(now(), 1) - 1), date_str, null)) work_date_set_of_near_2_week
        from saas_report.dim_date
        where month_id = extract(year_month from now())
        and work_day = 1
    ) b
;

desc saas_report.dim_date;

select week(now(), 0), week(now(), 1);

select concat(left(@current_week_year_period, 10), ' 00:00:00') as current_week_start
	, concat(right(@current_week_year_period, 10), ' 23:59:59') as current_week_end
	, concat(left(@last_week_year_period, 10), ' 00:00:00') as previous_week_start
	, concat(right(@last_week_year_period, 10), ' 23:59:59') as previous_week_end
	, date_format(now(), '%Y-%m-01 00:00:00') as current_month_start
	, concat(last_day(now()), ' 23:59:59') as current_month_end
	, concat(year(now()), '-01-01 00:00:00') as current_year_start
	, concat(year(now()), '-12-31 23:59:59') as current_year_end
from saas_report.dim_date a, (
	select @current_week_year_period := replace(week_ofyear_period, '/', '-')
		, @last_week_year_period := replace(last_week_ofyear_period, '/', '-')
		, @previous_month_today := date_sub(current_date(), interval 1 month)
	from saas_report.dim_date
	where date_str = current_date()
) b
where date_str = current_date()
;

select a.staff_login_name




        from (
            select staff_login_name
                , group_concat(distinct staff_name) as staff_name 
            from saas_report.rpt_srm_v2_merchants_supplier_releation
            group by staff_login_name
        ) a
        left join (
            select staff_login_name
                , group_concat(distinct category) as category
                , max(if(date_range_group = 'today' and category like '%-rtm', prepared_value, null)) as today_value
                , max(if(date_range_group = 'today' and category like '%-rtm', prepared_rank, null)) as today_rank
                , max(if(date_range_group = 'today' and category like '%-t1', prepared_value, null)) as last_work_day_value
                , max(if(date_range_group = 'today' and category like '%-t1', prepared_rank, null)) as last_work_day_rank
                , max(if(date_range_group = 'week' and category like '%-rtm', prepared_value, null)) as current_week_value
                , max(if(date_range_group = 'week' and category like '%-rtm', prepared_rank, null)) as current_week_rank
                , max(if(date_range_group = 'week' and category like '%-t1', prepared_value, null)) as previous_week_value
                , max(if(date_range_group = 'week' and category like '%-t1', prepared_rank, null)) as previous_week_rank
                , max(if(date_range_group = 'month' and category like '%-rtm', prepared_value, null)) as current_month_value
                , max(if(date_range_group = 'month' and category like '%-rtm', prepared_rank, null)) as current_month_rank
                , max(if(date_range_group = 'month' and category like '%-t1', prepared_value, null)) as last_month_value
                , max(if(date_range_group = 'month' and category like '%-t1', prepared_rank, null)) as last_month_rank
            from (
                select category
                    , staff_login_name
                    , date_range_group
                    , prepared_value as prepared_value
                    , prepared_rank as prepared_rank
                from saas_report.rpt_srm_v2_presonal_performance
                where category like concat_ws('-', (
                    case  'sales'
                        when 'sales' then 'sales'
                        when 'profit' then 'profit'
                        when 'cf_b1OweCompany' then 'cf_b1OweCompany'
                        when 'cf_companyOweB1' then 'cf_companyOweB1'
                        when 'cf_t1Subtract' then 'cf_t1Subtract'
                        else null
                    end
                ), '%')
            ) c
            group by staff_login_name
        ) b
on a.staff_login_name = b.staff_login_name
