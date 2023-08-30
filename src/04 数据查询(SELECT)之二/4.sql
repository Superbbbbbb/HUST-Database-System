select *
from(
    select
        pro_pif_id, 
        count(pro_pif_id) as cc, 
        dense_rank() over(order by count(pro_pif_id) desc) as prank
    from property
    where pro_type=1
    and pro_pif_id in (
            select distinct pro_pif_id
            from property
            left join(
                select pro_c_id,dense_rank() over(order by pro_quantity desc) as rk
                from property
                where pro_type=1 and pro_pif_id=14
            ) as t1 on pro_c_id=t1.id
            where t1.rk<=3 and pro_type=1 and pro_pif_id<>14
        )
    group by pro_pif_id
    order by prank,pro_pif_id
) t2
where prank<=3;