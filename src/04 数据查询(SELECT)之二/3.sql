select pro_c_id
from(
   select
      pro_c_id,
      count(pro_c_id) as cnt
   from(
      select pro_c_id,pro_pif_id
      from property
      where pro_type=1
   )as p1,(
      select
         pro_pif_id,
         count(*) as cnt
      from property
      where pro_type=1
      group by pro_pif_id
      having cnt>2
   )as p2
   where p1.pro_pif_id=p2.pro_pif_id
   group by pro_c_id
   having cnt=(
      select count(*)
      from(
         select
            pro_pif_id,
            count(*) as cnt
         from property
         where pro_type=1
         group by pro_pif_id
         having cnt>2
      )as t1
   )
   order by pro_c_id
)as t2;