select
c_id,
c_name,
IFNULL(number_of_cards,0) as number_of_cards
from client
left join (
	select
        b_c_id,
        count(b_c_id) as number_of_cards 
	from bank_card
	group by b_c_id
	order by number_of_cards desc,b_c_id
) as t on c_id = b_c_id
where c_name like '黄%';
