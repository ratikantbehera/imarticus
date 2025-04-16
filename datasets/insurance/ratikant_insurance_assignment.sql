#1. Count for each categories of ‘region
select region, count(region) as amount from insurance group by region order by region;

#2. Find 50 records of highest ‘age’ and export data/table to desktop
select * from insurance order by age desc limit 50;

#3. Add index name ‘quick’ on ‘id’
create index quick on insurance(id);

#4. Describe the schema of table
describe insurance;

#5. Create view name as ‘gender’ where users can not see ‘sex’ [Hint: first run appropriate query then create view]
create view gender as select id, age, bmi, children, smoker, region, charges from insurance;

#6. Rename the view as ‘type’
rename table gender to type;

#7. Count how many are ‘northwest’ insurance holders
select * from (select region, count(region) as amount from insurance group by region order by region) as t where region='northwest';

#8. Count how many insurance holders were ‘femail’
select * from (select sex, count(sex) as amount from insurance group by sex order by sex) as t where sex='female';

#9. Create Primary key on a suitable column
alter table insurance add primary key (id);

#10. Create a new column ‘ratio’ which is age multiply by bmi
alter table insurance add ratio double as (age*bmi);

#11. Arrange the table from high to low according to charges
select * from insurance order by charges desc;

#12. Find MAX of ‘charges’
select max(charges) as max_charge from insurance;

#13. Find MIN of ‘charges’
select min(charges) as min_charge from insurance;

#14. Find average of ‘charges’ of male and female
select sex, avg(charges) as avg_charges from insurance group by sex order by sex;

#15. Write a Query to rename column name sex to Gender
alter table insurance rename column sex to gender;

#16. Add new column as HL_Charges where more than average charges should be categorized as HIGH and less than average charges should be categorized as LOW
with hlcte as (select avg(charges) as avg_charges from insurance)
select insurance.*, case when charges<avg_charges then 'LOW' else 'HIGH' end as HL_Charges from insurance,hlcte;

#17. Change location/position of ‘smoker’ and bring before ‘children’
alter table insurance modify children int after smoker;

#18. Show top 20 records
select * from insurance limit 20;

#19. Show bottom 20 records
select * from (select * from insurance order by id desc limit 20) as t order by id;

#20. Randomly select 20% of records and export to desktop
set @x = (select cast(round(0.2*count(*)) as unsigned) from insurance);
prepare y from 'select * from insurance order by rand() limit ?';
execute y using @x;

#21. Remove column ‘ratio’
alter table insurance drop ratio;

#22. Craete one example of Sub Queries involving ‘bmi’ and ‘sex’ and give explanation in the script itself with remarks by using #
#The following query shows the average bmi of females
select * from (select gender, avg(bmi) as avg_bmi from insurance group by gender) as t where gender='female';

#23. Create a view called Female_HL_Charges that shows only those data where HL_Charges is High, Female, Smokers and with 0 children
create view female_hl_charges as select * from (with hlcte as (select avg(charges) as avg_charges from insurance)
select insurance.*, case when charges<avg_charges then 'LOW' else 'HIGH' end as HL_Charges from insurance,hlcte) as t
where HL_Charges='HIGH' and gender='female' and smoker='yes' and children=0;