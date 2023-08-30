select
    wk week_of_trading,
    sum(if(d=0, amount, null)) Monday,
    sum(if(d=1, amount, null)) Tuesday,
    sum(if(d=2, amount, null)) Wednesday,
    sum(if(d=3, amount, null)) Thursday,
    sum(if(d=4, amount, null)) Friday
from (
    select
        week(pro_purchase_time) - 5 as wk,
        weekday(pro_purchase_time) as d,
        sum(pro_quantity * f_amount) as amount
    from property
    join fund on pro_pif_id = f_id
    where pro_purchase_time like "2022-02-%" 
      and pro_type = 3
    group by pro_purchase_time
) t
group by wk;