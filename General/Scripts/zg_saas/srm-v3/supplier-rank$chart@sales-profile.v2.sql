-- /report_service/api/srm/v2.1/supplierRank
-- group: 个人业绩-sales/销量排行-profile


    select a.supplier_id
    	, a.supplier_fullname
	    , coalesce(b.current_plan_weight, 0) as current_plan_weight
	    , coalesce(b.previous_plan_weight, 0) as previous_plan_weight
	    , coalesce(b.estimated_profit, 0) as estimated_profit
	    , if(b.previous_plan_weight > 0, concat(round((coalesce(b.current_plan_weight, 0) - coalesce(b.previous_plan_weight, 0)) / coalesce(b.previous_plan_weight, 0) * 100, 3), '%'), '-') as plan_weight_m2m
    from (
    	select supplier_id, supplier_fullname
	        , null as current_plan_weight
	        , null as previous_plan_weight
	        , null as estimated_profit
	    from saas_report.rpt_srm_v2_merchants_supplier_releation
	    where region_name = '电商招商'
	    group by supplier_id, supplier_fullname
    ) a
    left join (
	    select supplier_id, supplier_fullname
	        , coalesce(sum(c.current_plan_weight), 0) as current_plan_weight
	        , coalesce(sum(c.previous_plan_weight), 0) as previous_plan_weight
	        , coalesce(sum(c.estimated_profit), 0) as estimated_profit
	    from (
	        select 'rtm' as cate
	            , supplier_id
	            , supplier_fullname
	            , plan_weight as current_plan_weight
	            , null as previous_plan_weight
	            , estimated_profit
	        from rpt_srm_v2_merchants_purchase_detail_rtm 
	        /**
	        <where>
	            order_date between #{dxv.nature_start} and #{dxv.nature_end}
	            <if test="null != params.usernames">
	                <foreach item="item" collection="params.usernames" separator="," open="AND staff_login_name IN (" close=")">
	                    #{item}
	                </foreach>
	            </if>   
	        </where>
	        **/
	        union all
	        select 't1l' as cate
	            , supplier_id
	            , supplier_fullname
	            , null as current_plan_weight
	            , plan_weight as previous_plan_weight
	            , estimated_profit
	        from rpt_srm_v2_merchants_purchase_detail_log  
	        /**
	        <where>
	            order_date between #{dxv.nature_start} and #{dxv.nature_end}
	            <if test="null != params.usernames">
	                <foreach item="item" collection="params.usernames" separator="," open="AND staff_login_name IN (" close=")">
	                    #{item}
	                </foreach>
	            </if>   
	        </where>
	        **/
	    ) c
	    group by supplier_id, supplier_fullname
    ) b
    on a.supplier_id = b.supplier_id

