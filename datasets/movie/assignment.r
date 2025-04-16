# Changing the working directory
setwd('D:/PGDA 41/SQL/Project/Movie Dataset with Questions/')

# Loading the data sets
actor <- read.csv("actor.csv")
cast <- read.csv("cast.csv")
director <- read.csv("director.csv")
genres <- read.csv("genres.csv")
movie <- read.csv("movie.csv")
movdir <- read.csv("movie_direction.csv")
movgen <- read.csv("movie_genres.csv")
ratings <- read.csv("ratings.csv")
rev <- read.csv("reviewer.csv")

# find when the movie 'American Beauty' released. Return movie release year.
movie[movie$mov_title=='American Beauty','mov_year']

# find those movies, which were released before 1998. Return movie title.
movie[movie$mov_year<1998,'mov_title']

# Write a query where it should contain all the data of the movies which were released after 1995 and their movie duration was greater than 120.
View(movie[movie$mov_year>1995&movie$mov_time>120,])

# Write a query to determine the Top 7 movies which were released in United Kingdom. Sort the data in ascending order of the movie year.
x<-movie[movie$mov_rel_country=='UK'&movie$mov_dt_rel!='',]
View(head(x[order(x$mov_dt_rel),],n=7))

# Set the language of movie language as 'Chinese' for the movie which has its existing language as Japanese and the movie year was 2001.
movie[movie$mov_lang=='Japanese'&movie$mov_year==2001,'mov_lang']='Chinese'

# find name of all the reviewers who rated the movie 'Slumdog Millionaire'.
a<-merge(x=rev,y=ratings,by='rev_id')
b<-merge(x=a,y=movie,by='mov_id')
b[b$mov_title=='Slumdog Millionaire','rev_name']

# fetch the first name, last name & role played by the actor where output should all exclude Male actors.
c<-merge(x=cast,y=actor,by='act_id')
View(c[c$act_gender!='M',c('act_fname','act_lname','role')])

# find the actors who played a role in the movie 'Annie Hall'. Fetch all the fields of actor table.
d<-merge(x=actor,y=cast,by='act_id')
e<-merge(x=d,y=movie,by='mov_id')
f<-e[e$mov_title=='Annie Hall',c('act_id','act_fname','act_lname','act_gender')]
View(f)

# find those movies that have been released in countries other than the United Kingdom. Return movie title, movie year, movie time, and date of release, releasing country.
View(movie[movie$mov_dt_rel!=''&movie$mov_rel_country!='UK',!(colnames(movie) %in% c('mov_id','mov_lang'))])

# Print genre title, maximum movie duration and the count the number of movies in each genre.
g<-merge(x=genres,y=movgen,by='gen_id')
h<-merge(x=g,y=movie,by='mov_id')
i<-h[,c('gen_title','mov_title','mov_time')]
j<-aggregate(i$gen_title,by=list(i$gen_title),FUN=table)
k<-aggregate(i$mov_time,by=list(i$gen_title),FUN=max)
colnames(j)<-c('gen_title','Count')
colnames(k)<-c('gen_title','Max_dur')
l<-merge(x=j,y=k,by='gen_title')
View(l)

# Create a view which should contain the first name, last name, title of the movie & role played by particular actor.
m<-merge(x=cast,y=actor,by='act_id')
n<-merge(x=m,y=movie,by='mov_id')
o<-View(n[,c('act_fname','act_lname','mov_title','role')])
o

# find the movies with the lowest ratings
p<-merge(x=movie,y=ratings,by='mov_id')
q<-p[!is.na(p$num_o_ratings),]
r<-head(q[order(q$num_o_ratings),],n=1)
View(r)