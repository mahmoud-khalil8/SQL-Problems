select employeeUNI.unique_id,employees.name from employeeuni 
right join employees on 
employeeUNI.id=employees.id ;