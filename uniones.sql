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
    A_ID int unique not null,
    B_ID int unique not null primary key    
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




