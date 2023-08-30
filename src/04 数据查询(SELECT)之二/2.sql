select p.pro_c_id as 'pro_c_id'
from(
    select
        pro_c_id,
        count(p_id) as cnt
  from finances_product,property
  where p_id=pro_pif_id
    and pro_type=1
  group by pro_c_id
  having cnt>=3
)as p,(
    select
        pro_c_id,
        count(f_id) as cnt
    from fund,property
    where f_id=pro_pif_id
      and pro_type=3
    group by pro_c_id
)as f
where p.pro_c_id=f.pro_c_id
  and p.cnt>f.cnt;