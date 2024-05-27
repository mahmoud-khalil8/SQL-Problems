select p.project_id,round(ifnull(avg(e.experience_years),0),2) as average_years  from project p left join employee e on p.employee_id=e.employee_id
group by project_id
;