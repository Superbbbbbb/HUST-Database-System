use MyDb;
create table if not exists hr(
    id char(10) primary key,
    name varchar(32) not null,
    mz char(16) default '汉族'
);