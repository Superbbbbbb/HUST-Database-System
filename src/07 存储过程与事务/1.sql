use fib;

drop procedure if exists sp_fibonacci;
delimiter $$
create procedure sp_fibonacci(in m int)
begin
    declare n int default 0;
    declare a int default 0;
    declare b int default 1;
    declare c int default 0;
    TRUNCATE TABLE fibonacci;
    WHILE n<m DO
        insert into fibonacci values(n,a);
        SET c=a+b;
        SET a=b;
        SET b=c;
        SET n=n+1;
    END WHILE;

end $$

delimiter ;
