select
    pro_c_id,sum(pro_income) as total_revenue,
    rank() over(ORDER BY sum(pro_income) DESC) as 'rank'
from property
WHERE pro_type=3
GROUP BY pro_c_id
order by total_revenue desc,pro_c_id;

-- (2) 基金总收益排名(名次连续)
select
    pro_c_id,sum(pro_income) as total_revenue,
    dense_rank() over(ORDER BY sum(pro_income) DESC) as 'rank'
from property
WHERE pro_type=3
GROUP BY pro_c_id
order by total_revenue desc,pro_c_id;