with friend_salary as (
select f.id , p.salary as friendSalary  from friends f join packages p on p.id =f.friend_id 
)
select s.name from students s join friends f on f.id =s.id join packages p on p.id=f.id join friend_salary fs on fs.id=s.id  where fs.friendSalary>p.salary

order by fs.friendSalary ;