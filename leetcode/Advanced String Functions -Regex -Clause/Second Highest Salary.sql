select case when count(distinct salary >1) then (select distinct  salary from employee order by salary desc limit 1 offset 1) else null end  as SecondHighestSalary from employee;