select
c_name,
c_id_card,
sum(pro_income) as total_income
from client, property
where pro_c_id=c_id
  and pro_status not like '冻结'
group by c_id
order by total_income desc
limit 3;
