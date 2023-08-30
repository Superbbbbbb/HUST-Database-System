select
    p1.pro_c_id as pro_c_id,
    p2.pro_c_id as pro_c_id,
    count(*) as total_count
from(
    select
        pro_c_id,
        pro_pif_id
    from property
    where pro_type=1
)as p1,(
    select
        pro_c_id,
        pro_pif_id
    from property
    where pro_type=1
)as p2
where p1.pro_c_id<>p2.pro_c_id
  and p1.pro_pif_id=p2.pro_pif_id
group by p1.pro_c_id,p2.pro_c_id
having total_count>=2
order by p1.pro_c_id,p2.pro_c_id;