set session transaction isolation level read committed;

start transaction;

insert into result 
select now(),1 t, tickets from ticket where flight_no = 'CZ5525';

set @n = sleep(2);

update ticket set tickets = tickets - 1 where flight_no = 'CZ5525';
insert into result
select now(),1 t, tickets from ticket where flight_no = 'CZ5525';

set @n = sleep(1);

commit;

set @n = sleep(2);

insert into result
select now(), 1 t, tickets from ticket where flight_no = 'CZ5525';