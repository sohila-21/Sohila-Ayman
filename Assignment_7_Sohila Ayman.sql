-- Task 1: Creating a Simple View
-- Create a simple view named vw_employee_details that displays the first name, last name, and department name of employees.

create view vw_employee_details as select first_name, last_name, department_name from employees
join departments on employees.department_id = departments.department_id;

drop view vw_employee_details;

--Task 2: Modifying a View
--Modify the existing view vw_work_hrs to only include employees working in department number 5

create or alter view vw_work_hrs as select e.first_name,e.last_name,j.job_title, d.department_id 
from employees e  join jobs j on e.job_id = j.job_id 
join departments d on e.department_id = d.department_id where e.department_id = 5;

--Task 3: Creating Views with Check Option-- Create a view named vw_high_status_suppliers to display all suppliers with a status greater than 15, and ensure that any updates or inserts through the view still meet the status conditioncreate view  vw_high_status_suppliers  as select * from suppliers where status > 15 with check option;