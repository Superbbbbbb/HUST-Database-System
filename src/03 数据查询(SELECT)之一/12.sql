select
    c_name,
    c_id_card,
    IFNULL(p.total,0)+IFNULL(i.total,0)+IFNULL(f.total,0) as total_amount
from client
left join(
    select
        pro_c_id,
        sum(p_amount*pro_quantity) as total
    from finances_product,property
    where p_id = pro_pif_id
      and pro_type=1
    group by pro_c_id
) as p on c_id=p.pro_c_id
left join(
    select 
        pro_c_id,
        sum(i_amount*pro_quantity) as total
    from insurance,property
    where i_id = pro_pif_id and pro_type=2
    group by pro_c_id
) as i on c_id=i.pro_c_id
left join(
    select 
        pro_c_id,
        sum(f_amount*pro_quantity) as total
    from fund,property
    where f_id = pro_pif_id
      and pro_type=3
    group by pro_c_id
) as f on c_id=f.pro_c_id
order by total_amount desc;