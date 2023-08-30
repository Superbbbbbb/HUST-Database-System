select *
from(
    select
        year(pro_purchase_time) as pyear,
        rank() over (partition by year(pro_purchase_time) order by sum(p_amount*pro_quantity) desc) as rk,
        p_id,
        sum(p_amount*pro_quantity) as sumamount
    from
        finances_product,
        property
    where p_id=pro_pif_id
      and pro_type=1
    group by p_id,year(pro_purchase_time)
    having pyear like '2010'
        or pyear like '2011'
) as p
where rk<=3;