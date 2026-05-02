--Triggers:-> It is a special procedures in a database that automatically execute predefined actions in response to certain events
-- on a specified table or view.

--UC1: Create a trigger so that if we insert/update negative salary in a table, it will be
-- triggered and set it to 0.

Create or replace function check_salary()
returns trigger as $$
Begin
if New.salary < 0 then 
   New.salary = 0;
end if;
return New;
End;
$$ Language plpgsql;

create trigger before_update_salary
before update on employees
for each row
execute function check_salary();

call update_emp_salary(2,-52000);

select * from employees;