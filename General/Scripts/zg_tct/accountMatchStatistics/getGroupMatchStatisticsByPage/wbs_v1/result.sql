-- CONNECTION: url=jdbc:mysql://10.0.12.22:3306/qshop_account

select pkid, app_id, enterprise_name, account_type, account_id, account_name,
    group_open_id, group_no, group_name, the_day_opportunity_count, add_time, company_name
from account_group_match_statistics
where 1=1
/**
and enterprise_name like CONCAT('%', #{enterpriseName,jdbcType=VARCHAR},'%')
and company_name like CONCAT('%', #{companyName},'%')
and account_name like CONCAT('%', #{accountName,jdbcType=VARCHAR},'%')
and group_no like CONCAT('%', #{groupNo,jdbcType=VARCHAR},'%')
and group_name like CONCAT('%', #{groupName,jdbcType=VARCHAR},'%')
and add_time &gt; STR_TO_DATE(#{addTimeStart,jdbcType=VARCHAR},'%Y-%m-%d') 
and add_time &lt;= STR_TO_DATE(CONCAT(#{addTimeEnd,jdbcType=VARCHAR}," 23:59:59"),'%Y-%m-%d %H:%i:%s:%f') 
and account_type = #{accountType,jdbcType=BIT}
and belong_industry = 4 -- #{belongIndustry,jdbcType=TINYINT}
order by ${sortName} ${sortOrder}
**/
order by modify_time asc,the_day_opportunity_count desc
-- limit #{start},#{pageSize}