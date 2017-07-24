use skoczkowie;


describe trenerzy;

SELECT 
    imie,
    nazwisko,
    kraj,
    CASE
        WHEN kraj = 'GER' THEN 'Niemcy'
        WHEN kraj = 'POL' THEN 'Polska'
        WHEN kraj = 'AUT' THEN 'Austria'
        WHEN kraj IS NOT NULL THEN 'brak info'
    END AS Zamiana
FROM
    skoczek;
            
SELECT 
    imie_t,
    nazwisko_t,
    COALESCE(data_ur_t, 'Brak daty') AS Brak_inf
FROM
    trenerzy;


SELECT 
    imie, nazwisko
FROM
    skoczek
WHERE
    (kraj = 'GER' OR kraj = 'AUT')
ORDER BY data_ur;

SELECT 
    imie, nazwisko, (waga / POW(wzrost / 100, 2)) AS BMI
FROM
    skoczek
WHERE
    (waga / POW(wzrost / 100, 2) < 20);

SELECT 
    imie, nazwisko, YEAR(NOW()) - YEAR(data_ur) AS Wiek
FROM
    skoczek
WHERE
    (YEAR(NOW()) - YEAR(data_ur) > 30);

SELECT 
    imie_t, nazwisko_t, data_ur_t
FROM
    trenerzy
WHERE
    data_ur_t IS NULL;

SELECT 
    *
FROM
    skoczek
WHERE
    MONTH(data_ur) >= 11
        OR MONTH(data_ur) <= 3;

SELECT 
    *
FROM
    skoczek
ORDER BY wzrost , nazwisko;

SELECT 
    *
FROM
    skoczek
ORDER BY nazwisko , wzrost;

SELECT 
    *
FROM
    skoczek
ORDER BY imie , nazwisko;

SELECT 
    *
FROM
    skoczek
ORDER BY kraj;

SELECT 
    *
FROM
    skoczek
ORDER BY data_ur DESC;

SELECT 
    CONCAT(imie, ' ', nazwisko, ' (', kraj, ')') AS Prezentacja
FROM
    skoczek
ORDER BY imie , nazwisko;



SELECT 
    *
FROM
    trenerzy
WHERE
    data_ur_t IS NOT NULL
ORDER BY data_ur_t;

SELECT 
    *
FROM
    trenerzy
WHERE
    data_ur_t
ORDER BY data_ur_t;

SELECT 
    imie,
    nazwisko,
    ROUND((waga / POW(wzrost / 100, 2)), 1) AS BMI
FROM
    skoczek
ORDER BY waga / POW(wzrost / 100, 2);

SELECT 
    imie,
    nazwisko,
    ROUND((waga / POW(wzrost / 100, 2)), 1) AS BMI
FROM
    skoczek
ORDER BY BMI;


#MS48
SELECT 
    *,
    ROUND((waga / POW(wzrost / 100, 2)), 1) AS BMI,
    CASE
        WHEN ROUND((waga / POW(wzrost / 100, 2)), 1) <= 20 THEN 'Zbyt Lekki '
        ELSE 'Waga ok'
    END AS Waga
FROM
    skoczek
    order by BMI,nazwisko;

select * from skoczek
order by rand();

select * from skoczek
order by wzrost  limit 1 offset 1;

select * from skoczek
order by wzrost;
    
select * from skoczek
order by wzrost desc limit 1 offset 1;

select 1,2 union select 3,4;


select imie, nazwisko, kraj, 'Zawodnik' as rola from skoczek union select imie_t, nazwisko_t, kraj, 'Trener' as rola from trenerzy;

select * from skoczek natural join trenerzy order by kraj;

select * from skoczek,trenerzy where skoczek.kraj = trenerzy.kraj;

select *  from zawody,skocznie where zawody.id_skoczni = skocznie.Id_skoczni;

select * from skoczek natural join trenerzy order by kraj;
 
select * from skoczek natural right join trenerzy;

select * from skoczek natural left join trenerzy;

select * from skoczek natural left join trenerzy
where trenerzy.imie_t is null;


select * from zawody natural left join skocznie;

select * from kibice left join skocznie on (kraj_s=kraj);

select * from skocznie left join zawody using(id_skoczni);

select * from skoczek  join skocznie on(kraj_s=kraj) natural join  zawody;

select * from skoczek left join trenerzy using(kraj)
where data_ur>data_ur_t;

select * from skoczek as Tab1 join skoczek  as Tab2 on((Tab1.kraj=Tab2.kraj)&&(Tab1.wzrost>Tab2.wzrost));


select * from zawody join skocznie using(id_skoczni) join skoczek on(kraj_s=kraj)  order by kraj,waga ;

select kraj, count(*) from skoczek group by kraj;

select count(*) from skoczek;

select kraj, count(*) from skoczek 
where wzrost>180
group by kraj;

select kraj, max(wzrost) as Sredni_Wzrost from skoczek
group by kraj
order by wzrost;

select *, max(wzrost) as Max_wzrost from skoczek
order by wzrost;

select*, case when month(data_ur)<=3 then count(*)
			when month(data_ur)>=4 && month(data_ur)<=6 then count(*)
            when month(data_ur)>=7 && month(data_ur)<=9 then count(*)
            when month(data_ur)>=10 && month(data_ur)<=12 then count(*)
            end as Liczba_na_kwartal
		from skoczek
        group by ;
        
        
        
        
select count(*) , quarter(data_ur) as kwartal from skoczek group by kwartal;

select year(data_ur) as rok, quarter(data_ur) as kwartal ,count(*) as liczba_urodzen from skoczek group by rok,kwartal;

select round(count(*)/count(distinct(kraj)))  as srednia_na_ekipe from skoczek order by kraj;

select sum(waga)/count(*) from skoczek;

select kraj, count(*) as ilosc from skoczek where wzrost>180 group by kraj having ilosc >2;

select kraj, avg(wzrost) as srednia from skoczek group by kraj having srednia;

select * from skoczek where wzrost>(select wzrost from skoczek where imie='Adam' and nazwisko='Małysz');

select * from skoczek where wzrost<(select wzrost from skoczek order by waga desc limit 1) ;

select * from skoczek where data_ur<(select data_ur from trenerzy where imie_t='Heinz' and nazwisko_t='Kuttin');

select imie,nazwisko,wzrost from skoczek order by wzrost desc limit 1;

select imie,nazwisko,wzrost from skoczek where wzrost>=(select wzrost from skoczek order by wzrost desc limit 1);

select *,avg(waga) as srednia from skoczek where waga>(select avg(waga) from skoczek) group by id_skoczka;
select * from skoczek where waga>(select avg(waga) from skoczek);

select avg(waga) from skoczek;


select * from skoczek where wzrost=(select wzrost from skoczek where imie='Janne' and nazwisko='AHONEN');


select * from skoczek where waga>(select avg(waga) from skoczek where kraj='POL');

select * from skoczek as tab1 where waga>(select avg(waga) from skoczek as tab2 where tab1.kraj = tab2.kraj);

select avg(waga) from skoczek where kraj='POL';


select kraj, sum(wzrost>180) as ilosc_zawodnikow from skoczek group by kraj;

select * from skoczek as tab1 where wzrost>(select avg(wzrost) from skoczek as tab2 where tab1.kraj = tab2.kraj);


select *,ROUND((waga / POW(wzrost / 100, 2)), 1) <= 20 as BMI from skoczek as tab1;