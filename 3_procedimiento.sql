/* Sintaxis de Declaración de procedimientos */

/* 1 - Cambio el caracter delimitador de consultas */
delimiter //

/* 2 - OPCIONAL PERO RECOMENDADO: 
    Borro el procedimiento si ya existe */
drop procedure if exists nueva_factura//

/* 3 - Creo el procedimiento indicando su nombre... */
create procedure nueva_factura(
    /* ...y sus datos de entrada (parámetros) */
    IN cliente_ced int,
    IN factura_estado enum("pago","no-pago")
)
BEGIN
    /* 4 - Al comienzo del procedimiento declaro cualquier variable
     inicial que precise para la ejecución del mismo*/
    declare factura_id int;

    /* 5 - Ingreso las consultas del procedimiento,
     vinculándolas a los parámetros*/
    insert into factura(estado) values(factura_estado);
    
    /* 6 - Para pasar datos a una variable auxilar puedo usar el
     comando "select [valor/variable/expresión] into variable" 
     o el comando "set variable = [valor/variable/expresión]"*/    
    select last_insert_id() into factura_id;
    
    insert into genera(cliente_ci, factura_num)
    values(cliente_ced, factura_id);

    /* 7 - Para entregar datos tras la ejecución, puedo utilizar
     el comando "select" al final del procedimiento */
    select factura_id as "Número de Factura";
END//

/* 8 - Tras la declaración del procedimiento, restauro el delimitador */
delimiter ;





