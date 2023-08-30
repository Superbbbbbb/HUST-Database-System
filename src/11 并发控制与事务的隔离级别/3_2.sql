set session transaction isolation level read uncommitted;
start transaction;

set @n = sleep(1);

insert into result 
select now(),2 t, tickets from ticket where flight_no = 'CZ5525';

set @n = sleep(2);
insert into result 
select now(), 2 t, tickets from ticket where flight_no = 'CZ5525';

update ticket set tickets = tickets - 1 where flight_no = 'CZ5525';

set @n = sleep(1);
insert into result 
select now(), 2 t, tickets from ticket where flight_no = 'CZ5525';

commit;
