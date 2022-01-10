-- CONNECTION: url=jdbc:mysql://10.0.12.22:3306/qshop

select count(1) as user_nums
from qshop.qd_buy_offer_4
where belong_industry = 4
and to_days(add_time) = to_days(now())-1
group by contact_qq;

select *
from qd_enterprise
-- where appid = #{appId, jdbcType=VARCHAR}
where appid = '202005214';