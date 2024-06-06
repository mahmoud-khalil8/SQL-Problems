with user as (
select u.name  from movierating m  join users u on m.user_id = u.user_id group by  m.user_id order by count(m.user_id) desc , u.name ASC limit 1 
),
 movie as(
  select m.movie_id  ,m2.title, avg(m.rating) from movierating m join movies m2 on m.movie_id=m2.movie_id where left(created_at ,7) ='2020-02' group by  movie_id order by avg(rating) desc ,m2.title ASC
   
  limit 1
  
)    
select name as results from user 
union all select title as results from movie 
