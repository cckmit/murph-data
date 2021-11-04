                    select 'advertising' as cate
                        , supplier_id
                        , null as current_plan_weight
                        , null as previous_plan_weight
                        , null as estimated_profit
                        , price as ad_incoming
                        , null as b1_company
                        , null as subtract_amount
                    from saas_report.srm_supplier_ad ad
                    where is_delete  = 'N' and tenant_code = 'ZG'
                    and deal_date between "2021-10-11 00:00:00" and "2021-10-17 23:59:59";
                    
                   
                    select 'rtm_sales/profit' as cate
                        , supplier_id
                        , order_date
                        , if(order_date between "2021-10-01 00:00:00" and "2021-10-31 23:59:59", plan_weight, null) as current_plan_weight
                        , if(order_date between "2021-09-01 00:00:00" and "2021-09-30 23:59:59", plan_weight, null) as previous_plan_weight
                        , if(order_date between "2021-10-01 00:00:00" and "2021-10-31 23:59:59", estimated_profit, null) as estimated_profit
                        , null as ad_incoming
                        , null as b1_company
                        , null as subtract_amount
                    from rpt_srm_v2_merchants_purchase_detail_rtm 
                    where supplier_id is not null
                    and order_date between "2021-09-01 00:00:00" and "2021-10-31 23:59:59"
                    and staff_login_name in ("fei.he")
                    ;
                   
                   
                   select staff_login_name , staff_name, supplier_id, supplier_fullname from saas_report.rpt_srm_v2_merchants_supplier_releation rsvmsr  where supplier_id in (
                   10004217, 10022714, 10004000, 10004649
                   );
                  
                  
                    select  supplier_id
                        , null as current_plan_weight
                        , null as previous_plan_weight
                        , null as estimated_profit
                        , null as ad_incoming
                        , if(available_balance > 0, available_balance, null) as b1_company
                        , subtract_amount as subtract_amount
                    from saas_report.rpt_srm_v2_supplier_owed_amount_rtm soa
                    <where>
                        <if test="params.label == 'today' or params.label == 'yesterday'">
                            biz_date between #{dnxv.nature_current_start} and #{dnxv.nature_current_end}
                        </if>
                        <if test="params.label != 'today' and params.label != 'yesterday'">
                            find_in_set(date_format(biz_date, '%Y-%m-%d'), #{dnxv.workday_set}) > 0
                        </if>
                        and exists ( 
                            select 1 
                            from saas_report.rpt_srm_v2_merchants_supplier_releation 
                            where supplier_id = soa.supplier_id 
                            <if test="null != params.usernames">
                                <foreach item="item" collection="params.usernames" separator="," open="and staff_login_name in (" close=")">
                                    #{item}
                                </foreach>
                            </if> 
                        )
                    </where>
  