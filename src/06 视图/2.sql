select
    c_name,
    c_id_card,sum(i_amount*pro_quantity) as insurance_total_amount,
    sum(pro_income) as insurance_total_revenue
from v_insurance_detail
group by c_name,c_id_card
order by insurance_total_amount desc;