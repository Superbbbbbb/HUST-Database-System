select distinct
    p0.pro_c_id as c_id1,
    p1.pro_c_id as c_id2
from property p0,property p1
where p0.pro_c_id<p1.pro_c_id
  and exists(
    select *
    from property p
    where p.pro_type=3
      and p.pro_c_id=p0.pro_c_id
)
  and not exists(
    select *
    from(
        select *
        from property p2
        where p2.pro_type=3
          and p2.pro_c_id=p0.pro_c_id
    ) t
    where not exists (
        select *
        from property p3 
        where p3.pro_type=3
          and p3.pro_pif_id = t.pro_pif_id
            and p3.pro_c_id = p1.pro_c_id
    )
    union
    select *
    from(
        select *
        from property p2
        where p2.pro_type=3
          and p2.pro_c_id=p1.pro_c_id
    ) t
    where not exists (
        select *
        from property p3 
        where p3.pro_type=3
          and p3.pro_pif_id = t.pro_pif_id
          and p3.pro_c_id = p0.pro_c_id
    )
);