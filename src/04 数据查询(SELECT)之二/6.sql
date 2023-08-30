select *
from(
    select 
        t1.c_id as pac,
        pro_c_id as pbc,
        count(*) as common,
        rank() over(partition by t1.c_id order by count(*),pro_c_id) as crank
    from
        property
        left join(
            select 
                pro_c_id as c_id,
                pro_pif_id as pif_id
            from property
            where pro_type=1
        )as t1 on pro_pif_id = t1.pif_id and pro_c_id<>t1.c_id
    where pro_type=1
      and t1.c_id is not null
    group by t1.c_id,pro_c_id
)as p2
where crank<3;