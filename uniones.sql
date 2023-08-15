/* Ejemplo para clase del 15-08-23 */

drop schema if exists bdunion;
create schema bdunion;
use bdunion;

create table A(
    ID int unique not null primary key auto_increment,
    dato varchar(20) not null
);

create table B(
    ID int unique not null primary key auto_increment,
    dato varchar(20) not null
);

create table R(
    ID int unique not null primary key auto_increment,
    A_ID int not null,
    B_ID int not null
);

alter table R
add constraint fk_A_R
foreign key (A_ID)
references A(ID)
on update cascade
on delete cascade;

alter table R
add constraint fk_R_B
foreign key (B_ID)
references B(ID)
on update cascade
on delete cascade;

insert into A
(dato)
values
("a1"),
("a2"),
("a3"),
("a4"),
("a5"),
("a6");

insert into B
(dato)
values
("b1"),
("b2"),
("b3"),
("b4"),
("b5"),
("b6"),
("b7"),
("b8"),
("b9"),
("b10"),
("b11"),
("b12");

insert into R
(A_ID, B_ID)
values
(2,4),
(5,1),
(6,1),
(6,2),
(2,5),
(2,6),
(4,2),
(5,2),
(1,2),
(2,5),
(1,5),
(1,6),
(4,6),
(5,2),
(3,2),
(3,1),
(2,5),
(1,2),
(6,2),
(2,6),
(2,5),
(2,5),
(6,4),
(6,2),
(6,2),
(4,5),
(6,1),
(5,2),
(1,4),
(2,2),
(5,2);



