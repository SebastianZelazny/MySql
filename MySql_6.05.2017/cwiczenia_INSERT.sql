create database DB1;
use DB1;

select database();

drop database db1;

create database weekend;
use weekend;

CREATE TABLE users (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(30) NOT NULL,
    Last VARCHAR(50) NOT NULL
);

describe users;

drop table users;

alter table users
change Last surname varchar(30);

alter table users rename as uzytkownicy;

describe uzytkownicy;

alter table uzytkownicy add PESEL varchar(11) unique;

create database skoczkowie;
use skoczkowie;

CREATE TABLE Skocznie (
    Id_skoczni INT,
    miasto TEXT,
    kraj_s TEXT,
    nazwa TEXT,
    k INT,
    sedz INT
);

describe skocznie;

CREATE TABLE trenerzy (
    kraj TEXT,
    imie_t TEXT,
    nazwisko_t TEXT,
    data_ur_t DATE
);

CREATE TABLE skoczek (
    id_skoczka INT,
    imie TEXT,
    nazwisko TEXT,
    kraj VARCHAR(3),
    data_ur DATE,
    wzrost INT,
    waga INT
);

CREATE TABLE zawody (
    id_zawodow INT,
    id_skoczni INT,
    daty DATE
);

CREATE TABLE kibice (
    imie_k text,
    nazwisko_k TEXT,
    data_ur DATE,
    kraj TEXT,
    wzrost INT
);

drop table kibice;

CREATE TABLE skladki (
    id_skladki INT PRIMARY KEY,
    kwota_skladki NUMERIC(11 , 2 ) NOT NULL CHECK (kwota_skladki > 0),
    data_skladki DATE,
    id_klienta INT REFERENCES kibice
);

describe skoczkowie;


CREATE TABLE example (
    kol1 TEXT,
    kol2 TEXT,
    kol3 TEXT
);

drop table example;

load data local infile "C:/Users/Sebastian/Desktop/MySql_6.05.2017/plik.txt" into table example;

select * from example;

delete from example;


insert into skocznie values(1, 'Zakopane','POL','Wielka Krokiew', 120, 134);
insert into skocznie values(2, 'Germisch-Parten','GER','Wielka Skocznia olimpijska', 115, 134);
insert into skocznie values(4, 'Obersdrof','GER','Skocznia Heiniego', 105, 134);
insert into skocznie values(3, 'Wilingen','FIN','Grosse schattenberg Krokiew', 130, 145);
insert into skocznie values(5, 'Kuupio','POL','Pujio', 116, 134);
insert into skocznie values(6, 'Lahti','FIN','Sallpuselka', 120, 131);
insert into skocznie values(7, 'Troundhom','GER','Wielka Krokiew', 116, 128);
insert into skocznie values(8, 'Obersdrof','NOR','Gramasen', 120, 132);

select * from skocznie;
#MS10
INSERT INTO skocznie VALUES (1, 'Zakopane', 'POL', 'Wielka Krokiew', 120, 134);
INSERT INTO skocznie VALUES (2, 'Garmisch-Partenkirchen', 'GER', 'Wielka Skocznia Olimpijska', 115, 125);
INSERT INTO skocznie VALUES (4, 'Oberstdorf', 'GER', 'Skocznia Heiniego Klopfera', 185, 211);
INSERT INTO skocznie VALUES (3, 'Oberstdorf', 'GER', 'Grosse Schattenberg', 120, 134);
INSERT INTO skocznie VALUES (5, 'Willingen', 'GER', 'Grosse Muhlenkopfschanze', 130, 145);
INSERT INTO skocznie VALUES (6, 'Kuopio', 'FIN', 'Puijo', 120, 131);
INSERT INTO skocznie VALUES (7, 'Lahti', 'FIN', 'Salpausselka', 116, 128);
INSERT INTO skocznie VALUES (8, 'Trondheim', 'NOR', 'Granasen', 120, 132);
select * from skocznie;
#MS11
INSERT INTO trenerzy VALUES ('AUT', 'Alexander', 'Pointner', NULL);
INSERT INTO trenerzy VALUES ('FIN', 'Tommi', 'Nikunen', NULL);
INSERT INTO trenerzy VALUES ('NOR', 'Mika', 'Kojonkoski', '1963-04-19');
INSERT INTO trenerzy VALUES ('POL', 'Heinz', 'Kuttin', '1971-01-05');
INSERT INTO trenerzy VALUES ('GER', 'Wolfang', 'Steiert', '1963-04-19');
INSERT INTO trenerzy VALUES ('JPN', 'Hirokazu', 'Yagi', NULL);
select * from trenerzy;
#MS12
INSERT INTO skoczek VALUES (2, 'Marcin', 'BACHLEDA', 'POL', '1982-09-04', 166, 56);
INSERT INTO skoczek VALUES (3, 'Robert', 'MATEJA', 'POL', '1974-10-05', 180, 63);
INSERT INTO skoczek VALUES (4, 'Alexander', 'HERR', 'GER', '1978-10-04', 173, 65);
INSERT INTO skoczek VALUES (5, 'Stephan', 'HOCKE', 'GER', '1983-10-20', 178, 59);
INSERT INTO skoczek VALUES (6, 'Martin', 'SCHMITT', 'GER', '1978-01-29', 181, 64);
INSERT INTO skoczek VALUES (7, 'Michael', 'UHRMANN', 'GER', '1978-09-09', 184, 64);
INSERT INTO skoczek VALUES (8, 'Georg', 'SPAETH', 'GER', '1981-02-24', 187, 68);
INSERT INTO skoczek VALUES (9, 'Matti', 'HAUTAMAEKI', 'FIN', '1981-07-14', 174, 57);
INSERT INTO skoczek VALUES (10, 'Tami', 'KIURU', 'FIN', '1976-09-13', 183, 59);
INSERT INTO skoczek VALUES (11, 'Janne', 'AHONEN', 'FIN', '1977-05-11', 184, 67);
INSERT INTO skoczek VALUES (12, 'Martin', 'HOELLWARTH', 'AUT', '1974-04-13', 182, 67);
INSERT INTO skoczek VALUES (13, 'Thomas', 'MORGENSTERN', 'AUT', '1986-10-30', 174, 57);
INSERT INTO skoczek VALUES (15, 'Tommy', 'INGEBRIGTSEN', 'NOR', '1977-08-08', 179, 56);
INSERT INTO skoczek VALUES (16, 'Bjoern-Einar', 'ROMOEREN', 'NOR', '1981-04-01', 182, 63);
INSERT INTO skoczek VALUES (17, 'Roar', 'LJOEKELSOEY', 'NOR', '1976-05-31', 175, 62);
INSERT INTO skoczek VALUES (14, 'Alan', 'ALBORN', 'USA', '1980-12-13', 177, 57);
INSERT INTO skoczek VALUES (1, 'Adam', 'MAŁYSZ', 'POL', '1977-12-03', 169, 60);
select * from skoczek;

drop table skoczek;
#MS13
INSERT INTO zawody VALUES (1, 1, '2017-01-23');
INSERT INTO zawody VALUES (2, 7, '2016-11-15');
INSERT INTO zawody VALUES (3, 3, '2016-12-26');
select * from zawody;
#MS14
INSERT INTO kibice (imie_k, nazwisko_k, kraj) VALUES ('Jan', 'Kowalski', 'POL');
INSERT INTO kibice (imie_k, nazwisko_k, wzrost) VALUES ('John', 'Smith', 172);
INSERT INTO kibice (imie_k, nazwisko_k, data_ur) VALUES ('Anna', 'Zawadzka', '1977-12-23');

SELECT 
    *
FROM
    kibice;

drop table skoczek;

DELETE FROM kibice 
WHERE
    imie_k = 'John' AND nazwisko_k = 'Smith';

UPDATE kibice 
SET 
    data_ur = '1974-12-08'
WHERE
    (imie_k = 'Jan'
        AND nazwisko_k = 'Kowalski');
        
UPDATE kibice,
    trenerzy 
SET 
    imie_k = 'Krzysztof'
WHERE
    kibice.kraj = trenerzy.kraj;
    
UPDATE kibice,
    skoczek 
SET 
    kibice.kraj = 'POL'
WHERE
    skoczek.imie = 'Adam';
    

    
update kibice,skoczek

set
	kibice.kraj=skoczek.kraj, kibice.imie_k='Anonim'
where
skoczek.kraj='pol' and  kibice.nazwisko_k='Smith';

update skoczek

set
wzrost=wzrost+2;

update skoczek

set
wzrost=wzrost-2;


select 3,4,5;

SELECT 
    imie AS First_name,
    nazwisko AS Last_name,
    'on jest z polski' AS pochodzenie,
    wzrost + 15 AS dl_nart
FROM
    skoczek
WHERE
    kraj = 'POL';
    

select distinct kraj from skoczek; #wartości unikatowe

select *,id_skoczka from skoczek where( wzrost > 180 and  wzrost <185); # wypisuje wszystkie informacje o skoczka o wzroscie pomiedzy 180 a 185


select imie, nazwisko, kraj from skoczek;

select imie,nazwisko, round((wzrost*1.46),1) as Narty  from skoczek ;

select *, round(waga/pow(wzrost/100,2),2) as BMI, 'W normie' as opis from skoczek where (waga/pow(wzrost/100,2) >= 18 and waga/pow(wzrost/100,2) <= 25);

select * from trenerzy where data_ur_t is null;

select ceil(2.56), conv(5,10,2);

select crc32('Ala'),crc32('ADA');

select year(now()), sysdate();

select date_format('2016-02-14', 'Mamy dzis %d dzien miesiaca .%y');


select imie,nazwisko, date_format(data_ur, '%d.%m.%Yr') from skoczek;

SELECT 
    imie,
    nazwisko,
    CONCAT(dayofyear((data_ur)),
            ' dnia ',
            YEAR(data_ur),
            ' roku') as data
FROM
    skoczek;

select imie,nazwisko, round((wzrost*1.46),1) as dlugosc_nart from skoczek;

select CONCAT(imie,' ',nazwisko,' (',kraj,')') as Prezentacja from skoczek;


select concat_ws(', ',imie, nazwisko,kraj) from skoczek;

select imie,nazwisko, (year(now())-year(data_ur)) as Wiek,((to_days(now())-to_days(data_ur))/365) as liczba_dni from skoczek;

select *, round(waga/pow(wzrost/100,2),2) as BMI, 'BMI W normie' as opis from skoczek where (waga/pow(wzrost/100,2) >= 20);

select *, 'TAK' as Info  from trenerzy where data_ur_t is not null;

select upper(imie) as Imie,upper(nazwisko) as Nazwisko from skoczek;

select bit_length(imie) as imie, bit_length(nazwisko) as Nazwisko from skoczek;

select ltrim('      wwwdawdawdada     ');

select lpad(imie, 30,'0') from skoczek;

select concat(imie,space(5),nazwisko) from skoczek;

select insert(imie,2,2,'xx') from skoczek;

select imie,repeat(imie,2) as double_2 from skoczek;

select imie,nazwisko,kraj,
 replace(kraj, 'POL', 'GER') as Zamienione from skoczek;