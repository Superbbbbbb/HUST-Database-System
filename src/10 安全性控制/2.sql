create role client_manager;
create role fund_manager;
grant select,insert,update on table client to client_manager;
grant select(b_c_id),select(b_number),select(b_type) on table bank_card to client_manager;
grant select,insert,update on fund to fund_manager;
grant client_manager to tom,jerry;
grant fund_manager to Cindy;