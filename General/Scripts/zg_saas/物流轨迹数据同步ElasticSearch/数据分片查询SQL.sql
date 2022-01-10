select id as _id, order_id, order_code, vehicle_num, lat, lon, gtm, spd, mlg, hgt, agl, valid, created_by, created_time, last_modified_by, last_modified_time from logistics_blm_order.t_order_trace_vehicle where extract(year_month from last_modified_time) = extract(year_month from date_sub(current_date(), interval 3 month)) 
;

