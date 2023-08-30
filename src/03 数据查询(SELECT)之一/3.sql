select
    c_name,
    c_mail,
    c_phone
from client
where c_id in (
    select pro_c_id
    from property
    where pro_type=2
) and c_id in (
      select pro_c_id
      from property
      where pro_type=3
) order by c_id;