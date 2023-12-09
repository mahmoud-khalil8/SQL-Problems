select case 
when grade < 8 then null
else students.name 
end 
,grades.grade ,students.marks from students,grades where students.marks>=grades.Min_mark AND students.marks<=grades.max_mark
order by grades.grade DESC, students.name; 