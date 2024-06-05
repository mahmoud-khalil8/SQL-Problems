select  e.employee_id ,e.name,count(e.employee_id)as reports_count, 
 round(avg(e2.age))  as  average_age
  from employees  e
join employees e2 on e.employee_id =e2.reports_to group by e.employee_id,e.name order by employee_id
 ;