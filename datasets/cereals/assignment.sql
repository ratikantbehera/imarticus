#Q.5
select * from (select type, count(type) as amount from cereals group by type) as t where type='C';

#Q.6
select * from (select shelf, count(shelf) as amount from cereals group by shelf order by shelf) as t where shelf=3;

#Q.7
select * from cereals order by rating desc;

#Q.9
select type, avg(calories) as avg_cal from cereals group by type;

#Q.10
with hlcte as (select avg(calories) as avg_cal from cereals)
select cereals.*, case when calories < avg_cal then 'LOW' else 'HIGH' end as HL_Calories from cereals,hlcte;

#Q.11
select name from cereals where name like 'B%';

#Q.12
select name from cereals where name like 'F%';

#Q.13
select name from cereals where name like '%s';

#Q.14
select * from (with hlcte as (select avg(calories) as avg_cal from cereals)
select cereals.*, case when calories < avg_cal then 'LOW' else 'HIGH' end as HL_Calories from cereals,hlcte) as t
where HL_Calories='HIGH';

#Q.15
select max(rating) as max_rating from cereals;

#Q.16
select HL_Calories, avg(rating) as avg_rating from (with hlcte as (select avg(calories) as avg_cal from cereals)
select cereals.*, case when calories < avg_cal then 'LOW' else 'HIGH' end as HL_Calories from cereals,hlcte) as t
group by HL_Calories;

#Q.18
alter table cereals drop fat;

#Q.19
select mfr, count(mfr) as amount from cereals group by mfr;

#Q.20
select name, calories, rating from cereals;