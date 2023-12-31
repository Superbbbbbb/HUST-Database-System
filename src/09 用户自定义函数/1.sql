use finance1;
set global log_bin_trust_function_creators=1;
drop function IF EXISTS get_deposit;

delimiter $$
create function get_deposit(client_id int)
returns numeric(10,2)
begin
    DECLARE total numeric(10,2);

    SET total = (
    select sum(b_balance)
    from bank_card
    where b_c_id=client_id and b_type like '储蓄卡'
    group by b_c_id);

    return total;

end$$
delimiter ;


select 
    c_id_card,
    c_name,
    get_deposit(c_id) as total_deposit
from client
where get_deposit(c_id)>=1000000
order by total_deposit desc;