select
    pro_purchase_time,
    total_amount
from (
    select *,
        count(*) over(partition by workday - t2.r) as cnt
    from (
        select *,
            rank() over(order by workday) as r
        from (
            select
                pro_purchase_time, 
                sum(pro_quantity * f_amount) as total_amount, 
                datediff(pro_purchase_time, "2021-12-31") - 2 * week(pro_purchase_time) as workday
            from property, fund
            where pro_purchase_time like "2022-02-%"
              and pro_type = 3
              and pro_pif_id = f_id
            group by pro_purchase_time
            having total_amount > 1000000
        ) t1
    ) t2
) t3
where cnt >= 3;