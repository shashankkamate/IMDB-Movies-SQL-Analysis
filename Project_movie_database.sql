show databases;
select * from directors;
select * from movies;
select *
from movies as m
join directors as d
on m.director_id =d.id;
describe directors;
describe movies;
select * from movies limit 10;
select * from directors limit 10;
#1.can you get all data about movies?
select * from movies;
#2.how do you get all data about directors?
select * from directors;
#3.check how many movies are present in IMDB?
select count(*) as total_movies_in_IMDB from movies;
#4. find these 3 director: James Cameron,Luc Besson,John Woo ?
select * from directors where name in
("James Cameron","luc besson","john woo");
#5. find all directors name starting with S?
select * from directors where name like "S%";
#6. count female directors.
select count(*) from directors as female_directors 
where gender =1;
#7. find the name of the first 10 women directors?
select * from directors where gender = 1 order by id limit 10;
#8.find 10th female director name.
select name,id from directors 
where gender =1 order by id limit 9, 1;
#9. what are the 3 most popular movies?
select title ,popularity from movies order by
 popularity desc limit 3;
#10.what are 3 most bankable movies?
select title,revenue from movies order by revenue desc limit 3;
#11.what is the most awarded average vote since the january 1st 2000
select title, vote_average,vote_count,release_date from movies where
 release_date >= "2000-01-01" order by vote_average desc,
 vote_count desc limit 1;
 #12.which movies where directed by brenda champman ?
 select m.title,m.release_date,d.name as director_name
 from movies as m
 join directors as d
 on m.director_id =d.id
 where d.name ="brenda chapman";
 select * from directors where name like "brenda chapman%";
select m.title,d.name 
from movies as m
join directors as d
on m.director_id = d.id
where d.id =4801;
select * from movies where director_id =4801;
#13.which director made the most movies?
select d.id, d.name as director_name,
count(*) as total_movies
from directors as d
join movies as m
on d.id =m.director_id
group by d.id,d.name
order by total_movies desc limit 3;
#14.which director is the most bankable?
select d.name as director_name,m.title,
sum(m.revenue) as total_revenue
from directors as d
join movies as m
on d.id =m.director_id
group by d.name,m.title  order by total_revenue  desc
limit 1;
