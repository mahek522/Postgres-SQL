--CTE(Common Table expression)-> It is a temporary result set that you can define
--within a query to simplify complex SQL statements

--Use case:1 ->We want to calculate the average salary per department and then find all employees
--whose salary is above the average salary of their department

With avg_sal as (select dept, avg(salary) as avg_salary
from employees group by dept)

select e.emp_id, e.fname, e.dept, e.salary, a.avg_salary
from employees e
join avg_sal a On e.dept = a.dept
where e.salary > a.avg_salary;

--Use case:2 -> find the highest paid employee in each department.

with max_sal as ( select dept, max(salary) as max_salary from employees
group by dept)

select e.emp_id, e.fname, e.dept, e.salary from employees e
join max_sal m on e.dept = m.dept
where e.salary = m.max_salary;