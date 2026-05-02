--Windows functions
--OVER()
select fname, salary, sum(salary) over(order by salary)
from employees;

SELECT fname, salary,
       ROUND(AVG(salary) OVER (order by salary), 2) AS avg_salary
FROM employees;

--Row_number()
select row_number() over(order by fname), fname, dept, salary from employees;

select row_number() over(partition by dept), fname, dept, salary from employees;

--Rank()
select fname, salary, rank() over(order by salary desc)
from employees;

--Dense_rank()
select fname, salary, dense_rank() over(order by salary desc)
from employees;

--Lag()
select fname, salary, lag(salary) over() from employees;

--Lead()
select fname, salary, lead(salary) over() from employees;

select fname, salary, (salary - lead(salary) over(order by salary desc)) as salary_diff
from employees;