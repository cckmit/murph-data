create table if not exists tmp.table_name 
as select main_no_config.pkid, 
	main_no_config.app_id, 
	main_no_config.enterprise_name, 
	main_no_config.shop_status, 
	main_no_config.management_type, 
	main_no_config.product_status, 
	main_no_config.product_interface_status, 
	main_no_config.qq, 
	main_no_config.phone, 
	main_no_config.city, 
	main_no_config.dur_date, 
	main_no_config.carrier_id, 
	main_no_config.add_group_rules, 
	main_no_config.add_time, 
	main_no_config.add_by, 
	main_no_config.version_type, 
	main_no_config.modify_time, 
	main_no_config.modify_by, 
	main_no_config.valid, 
	main_no_config.match_share, 
	main_no_config.match_share_type, 
	main_no_config.quote_type, 
	main_no_config.belong_industry, 
	main_no_config.company_name, 
	main_no_config.redirect_type, 
	main_no_config.redirect_url, 
	main_no_config.big_main_no, 
	main_no_config.bRedirect_url, 
	main_no_config.spot_authen, 
	main_no_config.spot_promotion, 
	main_no_config.scrm_config, 
	main_no_config.order_config, 
	main_no_config.promotion_name, 
	main_no_config.group_config, 
	main_no_config.epc_times, 
	main_no_config.product_url_config, 
	main_no_config.black, 
	main_no_config.epc_config, 
	main_no_config.wechat_pay_config, 
	main_no_config.wechat_pay_mchid, 
	main_no_config.product_sharing,
	carrier.carrier_fullname as carrier_name,
	qd_enterprise.qd_no_name as version_name,
	qd_user_friend_count.cnt as focus_friend_count
from tct_ods.qshop_account_main_no_config main_no_config
inner join tct_ods.qshop_qd_enterprise qd_enterprise
on main_no_config.valid = 1 
and main_no_config.version_type in(0, null) 
and qd_enterprise.valid = 1 
and main_no_config.app_id = qd_enterprise.appid
left join tct_ods.qshop_account_carrier carrier
on carrier.valid = 1 
and main_no_config.carrier_id = carrier.pkid
left join (
	select app_id, count(1) as cnt
	from tct_ods.qshop_qd_user_friend
	where valid = 1
	group by app_id
) qd_user_friend_count
on main_no_config.app_id = qd_user_friend_count.app_id
;