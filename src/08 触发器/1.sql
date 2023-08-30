use finance1;
drop trigger if exists before_property_inserted;

delimiter $$
CREATE TRIGGER before_property_inserted BEFORE INSERT ON property
FOR EACH ROW 
BEGIN
    declare msg char(128) default CONCAT("type ",new.pro_type," is illegal!");
    declare msg1 char(128) default CONCAT("finances product #",new.pro_pif_id," not found!");
    declare msg2 char(128) default CONCAT("insurance #",new.pro_pif_id," not found!");
    declare msg3 char(128) default CONCAT("fund #",new.pro_pif_id," not found!");
    
    if new.pro_type not between 1 and 3
    then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;

    elseif new.pro_type=1 and (select count(*) from finances_product where p_id = new.pro_pif_id) = 0
    then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg1;

    elseif new.pro_type=2 and (select count(*) from insurance where i_id = new.pro_pif_id)=0
    then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg2;

    elseif new.pro_type=3 and (select count(*) from fund where f_id = new.pro_pif_id)=0
    then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg3;

    end if;

END$$

delimiter ;