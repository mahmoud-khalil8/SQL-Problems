with managerCount as (
    select id ,name ,department ,managerid ,count(*) as c from employee 
    group by managerid

)
select e.name from employee e join managerCount on managerCount.managerid=e.id and c>=5;