-- CONNECTION: url=jdbc:mysql://10.0.34.28:3306/saas_report
-- New script in report.

select json_extract(item_value, '$."25695"'), item_key, item_value
from fetched_redis_data
where redis_item = 'query.seller.login'
and item_key = 'hash/json'
and json_valid(item_value) = 1