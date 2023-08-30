create user tom identified by '123456';
create user jerry identified by '123456';
grant select(c_name),select(c_mail),select(c_phone) on table client to tom with grant option;
grant update(b_balance) on table bank_card to jerry;
revoke select on table bank_card from Cindy;
