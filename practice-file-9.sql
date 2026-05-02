--Stored Procedures
create or replace procedure update_emp_salary(
p_employee_id int,
p_new_salary numeric
)
language plpgsql
as $$
begin
update employees
set salary = p_new_salary
where emp_id = p_employee_id;
end;
$$;




--User defined functions
create or replace function dept_max_sal_emp1(dept_name varchar)
returns table(emp_id INT, fname varchar, salary numeric) as $$
begin
return query
select e.emp_id, e.fname, e.salary
from employees e
where 
e.dept = dept_name
and
e.salary = (
select max(emp.salary)
from employees emp
where emp.dept = dept_name
);
end;
$$ language plpgsql;
)

select * from employees;

