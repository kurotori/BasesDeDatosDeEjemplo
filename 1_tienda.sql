create schema tienda;
use tienda;

create table cliente(
    ci int not null unique primary key,
    nombre varchar(30) not null,
    apellido varchar(30) not null,
    direccion varchar(60) not null,
    localidad varchar(25) not null
);

create table factura(
    num int not null unique primary key auto_increment,
    fecha timestamp not null default current_timestamp,
    estado enum("pago","no-pago") not null
);

create table producto(
    cod int not null unique primary key,
    nombre varchar(30) not null,
    precio float(4,2) not null
);

create table genera(
    cliente_ci int not null,
    factura_num int not null unique primary key
);

create table contiene(
    factura_num int not null,
    producto_cod int not null,
    cant int not null,
    id int not null unique primary key auto_increment
);

alter table genera
add constraint fk_cliente_genera
foreign key (cliente_ci)
references cliente(ci)
on update cascade
on delete no action;

alter table genera
add constraint fk_genera_factura
foreign key (factura_num)
references factura(num)
on update cascade
on delete no action;

alter table contiene
add constraint fk_factura_contiene
foreign key (factura_num)
references factura(num)
on update cascade
on delete no action;

alter table contiene
add constraint fk_contiene_producto
foreign key (producto_cod)
references producto(cod)
on update cascade
on delete no action;














