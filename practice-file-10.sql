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

