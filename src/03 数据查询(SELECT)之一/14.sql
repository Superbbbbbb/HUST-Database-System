select
    i_id,i_amount
from insurance
where i_amount=(
    select distinct
        i_amount as ia
    from insurance
    order by i_amount desc
    limit 3,1
);