-- CONNECTION: url=jdbc:mysql://10.0.12.22:3306/qshop_account
/**
    select
    <include refid="Base_Column_List" />
    from account_date_statistics WHERE belong_industry = #{industry,jdbcType=TINYINT}
    And add_time = #{nowDate,jdbcType=DATE} AND data_type = #{dataType,jdbcType=BIGINT}
 **/

select pkid
from account_date_statistics 
where belong_industry = 4 -- #{industry,jdbctype=tinyint}
and add_time = current_date() -- #{nowdate,jdbctype=date} DateUtil.getDateFormat(new Date()) 
and data_type = 1	-- 1
;

-- 处理结果
insert into account_date_statistics 
( 
	pkid,
	belong_industry,
	nums,
	add_time,
	data_type,
	statistics_time
) values (
	-1, -- pkid,
	1, -- belong_industry,
	5, -- nums,
	now() , -- add_time,
	1, -- data_type,
	now() -- statistics_time
)
on duplicate key update
nums = values(nums), 
statistics_time = values(statistics_time)