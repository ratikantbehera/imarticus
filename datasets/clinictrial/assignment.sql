#Q.3
select avg(age) as avg_age from clinictrial;

#Q.4
select min(age) as min_age from clinictrial;

#Q.5
select max(age) as max_age from clinictrial;

select * from clinictrial;

#Q.6
select pregnant, avg(age) as avg_age from clinictrial group by pregnant;

#Q.7
select drug_reaction, avg(bp) as avg_bp from clinictrial group by Drug_Reaction;

#Q.8
select *, case when age between 16 and 21 then 'Low' when age between 21 and 35 then 'Middle' else 'High' end as age_group from clinictrial;

#Q.9
update clinictrial set age=32 where name='Reetika';

#Q.10
update clinictrial set name='Shara' where name='Reena';

#Q.11
alter table clinictrial drop Chlstrl;

#Q.12
select name, age, bp from clinictrial;

#Q.13
select name from clinictrial where name like 'E%';

#Q.14
with ahml as (select *, case when age between 16 and 21 then 'Low' when age between 21 and 35 then 'Middle' else 'High' end as age_group from clinictrial)
select name, age_group from ahml where age_group='Low';

#Q.15
with ahml as (select *, case when age between 16 and 21 then 'Low' when age between 21 and 35 then 'Middle' else 'High' end as age_group from clinictrial)
select name, age_group from ahml where age_group='High';

#Q.16
select name, pregnant from clinictrial where name like 'A%' and pregnant='yes';

#Q.17
select name, bp from clinictrial where bp > 120;

#Q.18
select name, bp from clinictrial where bp between 100 and 120;

#Q.19
select name, age, anxty_LH from clinictrial where age < 30 and Anxty_LH='no';

#Q.20
select name from clinictrial where name like '%i';

#Q.21
select name from clinictrial where name like '%a';

#Q.22
select name from clinictrial where name like 'K%';

#Q.23
select name from clinictrial where name like '%a%';

#Q.24
select name, bp from clinictrial order by bp;

#Q.25
select name, age from clinictrial order by age desc;