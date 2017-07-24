use skoczkowie;
select distinct kraj from skoczek;
create view kadra_GER as select imie,nazwisko,kraj from skoczek where kraj = "GER";
create view kadra_POL as select imie,nazwisko,kraj from skoczek where kraj = "POL";
create view kadra_FIN as select imie,nazwisko,kraj from skoczek where kraj = "FIN";
create view kadra_AUT as select imie,nazwisko,kraj from skoczek where kraj = "AUT";
create view kadra_NOR as select imie,nazwisko,kraj from skoczek where kraj = "NOR";
create view kadra_USA as select imie,nazwisko,kraj from skoczek where kraj = "USA";


create view zawodnicy_trenerzy as select imie, nazwisko, kraj, imie_t, nazwisko_t from skoczek natural left join trenerzy;

alter table trenerzy add column L_zawodnikow int;

select * from trenerzy;

select kraj,count(*) from skoczek group by kraj;

update trenerzy set l_zawodnikow = 2 where kraj ="AUT";

update trenerzy set l_zawodnikow = 3 where kraj ="FIN";

update trenerzy set l_zawodnikow = 5 where kraj ="GER";

update trenerzy set l_zawodnikow = 3 where kraj ="NOR";

update trenerzy set l_zawodnikow = 3 where kraj ="POL";

update trenerzy set l_zawodnikow = 1 where kraj ="USA";


create trigger trig_insert_zawodnik after insert on skoczek for each row update trenerzy set l_zawodnikow= l_zawodnikow + 1 where kraj=new.kraj;

insert into skoczek (id_skoczka,imie,nazwisko,kraj) value (15,'Michal','Nowy','POL');

select * from trenerzy;

select * from skoczek;



create trigger trig_delete_zawodnik after delete on skoczek for each row update trenerzy set l_zawodnikow= l_zawodnikow -1 where kraj=old.kraj;

delete from skoczek where imie='Michal';

create trigger trig_update_kraj after update on skoczek for each row update trenerzy set l_zawodnikow=l_zawodnikow + 1 where kraj=new.kraj;

create trigger trig_update_kraj_1 after update on skoczek for each row update trenerzy set l_zawodnikow=l_zawodnikow - 1 where kraj=old.kraj;

update skoczek set kraj = 'GER' where imie='Marcin';

drop trigger trig_update_kraj;
drop trigger trig_update_kraj_1;


update trenerzy set l_zawodnikow = 0 where imie_t ='Hirokazu';

update trenerzy set kraj = 'GER' where nazwisko_t ='Steiert';

update skoczek set kraj = 'POL' where imie='Adam';

update skoczek set kraj = 'POL' where imie='Marcin';



# Projektowanie SQL


create database ERD;

use erd;

create table users (
id_u int not null auto_increment,
imie_u varchar(50) not null,
imie2_u varchar(50) default 'Brak Imienia',
pesel_u varchar(11) not null unique,
primary key (id_u)
);

describe users;

show tables;

create table activ(
id_a int not null auto_increment,
id_u int not null,
opis_a text not null,
primary key (id_a),
foreign key(id_u) references users (id_u)
);

drop table actib;

insert into users (imie_u,imie2_u,pesel_u) value ('Adam','Jan','990222345');
insert into users (imie_u,imie2_u,pesel_u) value ('Tomasz','Michal','990222335');
insert into users (imie_u,pesel_u) value ('Alek','990222395');

select * from users;


insert into activ(id_u,opis_a) value(2,'Zeglarstow');
insert into activ(id_u,opis_a) value(2,'Pilka Nozna');
insert into activ(id_u,opis_a) value(2,'Siatkowka');
insert into activ(id_u,opis_a) value(2,'Koszykowka');

select * from activ;