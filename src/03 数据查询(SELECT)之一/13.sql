select
    c_id,
    c_name,
    IFNULL(b1.total,0)-IFNULL(b2.total,0)+IFNULL(p.total,0)+IFNULL(i.total,0)+IFNULL(f.total,0)+IFNULL(pp.total,0) as total_property
from client
left join(
    select 
        b_c_id,
        sum(b_balance) as total
    from bank_card
    where b_type like '储蓄卡'
    group by b_c_id
) as b1 on c_id=b1.b_c_id
left join(
    select 
        b_c_id,
        sum(b_balance) as total
    from bank_card
    where b_type like '信用卡'
    group by b_c_id
) as b2 on c_id=b2.b_c_id
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
    where i_id = pro_pif_id
      and pro_type=2
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
left join(
    select
        pro_c_id,
        sum(pro_income) as total
    from property
    group by pro_c_id
) as pp on c_id=pp.pro_c_id
order by c_id;