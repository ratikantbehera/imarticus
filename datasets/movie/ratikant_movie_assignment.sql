#1. Write a SQL query to find when the movie 'American Beauty' released. Return movie release year.
select mov_title, mov_year from movie where mov_title='american beauty';

#2. Write a SQL query to find those movies, which were released before 1998. Return movie title.
select mov_title, mov_year from movie where mov_year < 1998;

#3. Write a query where it should contain all the data of the movies which were released after 1995 and their movie duration was greater than 120.
select * from movie where mov_year > 1995 and mov_time > 120;

#4. Write a query to determine the Top 7 movies which were released in United Kingdom. Sort the data in ascending order of the movie year.
select * from movie where mov_rel_country='UK' order by mov_year limit 7;

#5. Set the language of movie language as 'Chinese' for the movie which has its existing language as Japanese and the movie year was 2001.
update movie set mov_lang='Chinese' where mov_lang='Japanese' and mov_year=2001;

#6. Write a SQL query to find name of all the reviewers who rated the movie 'Slumdog Millionaire'.
select mov_title, rev_name from movie inner join ratings using(mov_id) inner join reviewer using (rev_id) where mov_title='slumdog millionaire';

#7. Write a query which fetch the first name, last name & role played by the actor where output should all exclude Male actors.
select act_fname, act_lname, role from actor inner join cast using(act_id) where act_gender <> 'm';

#8. Write a SQL query to find the actors who played a role in the movie 'Annie Hall'. Fetch all the fields of actor table. (Hint: Use the IN operator).
select actor.* from actor inner join cast using(act_id) inner join movie using(mov_id) where mov_title='annie hall';

#9. Write a SQL query to find those movies that have been released in countries other than the United Kingdom. Return movie title, movie year, movie time, and date of release, releasing country.
select mov_title, mov_year, mov_time, mov_dt_rel, mov_rel_country from movie where mov_rel_country <> 'uk';

#10. Print genre title, maximum movie duration and the count the number of movies in each genre. (HINT: By using inner join)
select gen_title, count(mov_title) as no_of_mov, max(mov_time) as max_duration from genres inner join movie_genres using(gen_id) inner join movie using(mov_id) group by gen_title;

#11. Create a view which should contain the first name, last name, title of the movie & role played by particular actor.
create view actor_role as select act_fname, act_lname, mov_title, role from actor inner join cast using(act_id) inner join movie using(mov_id);

#12. Write a SQL query to find the movies with the lowest ratings
select * from movie inner join ratings using(mov_id) where num_o_ratings <> '' order by num_o_ratings limit 1;