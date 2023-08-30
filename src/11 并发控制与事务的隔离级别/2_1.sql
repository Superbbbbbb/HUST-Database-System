use testdb1;

set session transaction isolation level read uncommitted;

start transaction;

set @n = sleep(1);
select tickets from ticket where flight_no = 'CA8213';
commit;
