delimiter //

drop procedure if exists nueva_factura//

create procedure nueva_factura(
    IN cliente_ced int,
    IN factura_estado enum("pago","no-pago")
)
BEGIN
    declare factura_id int;
    insert into factura(estado) values(factura_estado);
    select last_insert_id() into factura_id;
    
    insert into genera(cliente_ci, factura_num)
    values(cliente_ced, factura_id);

    select factura_id;
END//
delimiter ;





