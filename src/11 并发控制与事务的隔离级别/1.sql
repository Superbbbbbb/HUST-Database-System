use testdb1;
set session transaction isolation level read uncommitted;
start transaction;
insert into dept(name) values('运维部');
rollback;