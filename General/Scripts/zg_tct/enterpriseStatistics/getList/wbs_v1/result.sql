-- CONNECTION: url=jdbc:mysql://10.0.12.22:3306/qshop_account
-- 任务门面：com.pmys.saas.backend.xxljob.handler.SyncEnterpriseStatisticsHandler#execute

select pkid, app_id, enterprise_name, company_name, carrier_name, carrier_id, 
    version_name, belong_industry, staff_count, friend_count, focus_group_count, 
    focus_friend_count, good_up_count, good_direct_count, good_spread_count, 
    add_time, expire_time, statistic_date,  group_sales_match_count, carrier_sales_match_count, 
    last_days, good_erp_count,login_time,group_reply_count,group_quote_count,
    carrier_reply_count,carrier_quote_count
from enterprise_statistics
/**
where company_name like concat('%', #{companyName}, '%')
and belong_industry = #{belongIndustry}
and version_name = #{versionName,jdbcType=VARCHAR}
and carrier_id = #{carrierId}
and last_days = #{lastDays}
and statistic_date = #{statisticDate}
and add_time <![CDATA[ >= ]]> STR_TO_DATE(#{addTimeStart,jdbcType=VARCHAR},'%Y-%m-%d')
and add_time <![CDATA[ <= ]]> STR_TO_DATE(CONCAT(#{addTimeEnd,jdbcType=VARCHAR}," 23:59:59"),'%Y-%m-%d %H:%i:%s:%f')
and expire_time <![CDATA[ >= ]]> STR_TO_DATE(#{durDateStart,jdbcType=VARCHAR},'%Y-%m-%d')
and expire_time <![CDATA[ <= ]]> STR_TO_DATE(CONCAT(#{durDateEnd,jdbcType=VARCHAR}," 23:59:59"),'%Y-%m-%d %H:%i:%s:%f')
and login_time <![CDATA[ >= ]]> STR_TO_DATE(#{loginDateStart,jdbcType=VARCHAR},'%Y-%m-%d')
and login_time <![CDATA[ <= ]]> STR_TO_DATE(CONCAT(#{loginDateEnd,jdbcType=VARCHAR}," 23:59:59"),'%Y-%m-%d %H:%i:%s:%f')
order by ${sortName} ${sortOrder}
**/
order by add_time desc
-- limit #{start},#{pageSize}
;


