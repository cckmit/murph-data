-- CONNECTION: url=jdbc:mysql://10.0.12.22:3306/qshop_account

-- pmys.saas.backend.ui / com.pmys.saas.backend.service.impl.EnterpriseStatisticsServiceImpl#handleData

select main_no_config.pkid, 
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
	carrier.carrier_fullname
from qshop_account.main_no_config
left join qshop_account.carrier
on main_no_config.app_id = carrier.pkid
where main_no_config.version_type in(0,'')