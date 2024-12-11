-- Task 1: Using Date and Time Functions
--Write a SQL query to retrieve all employees who were hired within the last 30 days from the current date.

select * from employees where hire_date >= dateadd(day, -30, getdate());

-- Task 2: Creating and Using a Stored Procedure
-- Create a stored procedure named sp_get_employee_hours that retrieves the first name,
-- last name, and total hours worked on projects for a given employee ID

create procedure sp_get_employee_hours (@emp_id int)
as begin
    select employees.first_name, employees.last_name, sum(works_on.total_hours)
    from employees
    join works_on  on e.SSN = w.ESSN
    where employees.emp_id = @emp_id
    group by employees.first_name, employees.last_name;
end;

-- Task 3: Creating a Stored Procedure for Employee Count by Department
-- Create a stored procedure named sp_department_employee_count that retrieves 
-- the department ID, department name, and the number of employees in each department,
-- but only for departments with more than 5 employees.

create procedure sp_department_employee_count
as begin
    select d.department_id, d.department_name, count(e.employee_id) as num_employees
    from departments d
    join employees e on d.department_id = e.department_id
    group by d.department_id, d.department_name
    having count(e.employee_id) > 5;
end;

