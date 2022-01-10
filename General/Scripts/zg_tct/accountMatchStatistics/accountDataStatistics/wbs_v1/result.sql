-- CONNECTION: url=jdbc:mysql://10.0.12.22:3306/qshop_account
-- “≥√Ê≤È—Ø
select pkid,belong_industry,nums,add_time,data_type,statistics_time
from account_date_statistics 
WHERE 1 = 1
and belong_industry = 4 -- #{belongIndustry,jdbcType=TINYINT}
-- and statistics_time &gt; #{addTimeStart,jdbcType=VARCHAR}
--  and statistics_time &lt;= #{addTimeEnd,jdbcType=VARCHAR}
and data_type = 1 -- #{dataType,jdbcType=TINYINT}