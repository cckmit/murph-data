-- /report_service/api/srm/v2.1/supplierRank
-- group: dailyAverageT1

    select a.supplier_id
    	, a.supplier_fullname
    	, coalesce(b.subtract_amount, 0) as subtract_amount
    from (
    	select supplier_id, supplier_fullname
	        , null as current_plan_weight
	        , null as previous_plan_weight
	        , null as estimated_profit
	    from saas_report.rpt_srm_v2_merchants_supplier_releation
	    where region_name = '╣Гилупил'
	    group by supplier_id, supplier_fullname
    ) a
    left join (
		select supplier_id, sum(subtract_amount) as subtract_amount
		from saas_report.rpt_srm_v2_supplier_owed_amount_rtm rtm
		where find_in_set(date_format(biz_date, '%Y-%m-%d'), '2021-09-01,2021-09-02,2021-09-03,2021-09-06,2021-09-07,2021-09-08,2021-09-09,2021-09-10,2021-09-13,2021-09-14,2021-09-15,2021-09-16,2021-09-17,2021-09-18,2021-09-22,2021-09-23,2021-09-24,2021-09-26,2021-09-27,2021-09-28,2021-09-29,2021-09-30') > 1
		and exists (
			select 1 
			from saas_report.rpt_srm_v2_merchants_supplier_releation
			where supplier_id = rtm.supplier_id 
		)
		group by supplier_id
	) b
	on a.supplier_id = b.supplier_id