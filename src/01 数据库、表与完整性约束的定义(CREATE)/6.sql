use MyDb;
create table if not exists s(
    sno char(10) primary key,
    name varchar(32) not null,
    ID char(18) unique
);
