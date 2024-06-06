 with cte as (
 select id,name,salary ,departmentid ,
 dense_rank() over (partition by departmentid order by salary desc  ) as rn
  from employee   
 )
 select department.name as department , cte.name as employee,cte.salary   from cte left join department on department.id=cte.departmentid where cte.rn<=3
 ;