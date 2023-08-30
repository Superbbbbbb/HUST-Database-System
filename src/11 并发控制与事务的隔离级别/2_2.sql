use testdb1;

set session transaction isolation level read uncommitted;
start transaction;

update ticket set tickets = tickets - 1 where flight_no = 'CA8213';

set @n = sleep(2);

rollback;