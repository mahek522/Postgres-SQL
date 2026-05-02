Create table employees(
emp_id serial primary key,
fname varchar(100) not null,
lname varchar(100) not null, 
email varchar(100) not null unique,
dept varchar(50),
salary decimal(10,2) default 30000.00,
hire_date date not null default current_date
);

INSERT INTO employees (emp_id, fname, lname, email, dept, salary, hire_date) 
VALUES
(1, 'Raj', 'Sharma', 'raj.sharma@example.com', 'IT', 50000.00, '2020-01-15'),
(2, 'Priya', 'Singh', 'priya.singh@example.com', 'HR', 45000.00, '2019-03-22'),
(3, 'Arjun', 'Verma', 'arjun.verma@example.com', 'IT', 55000.00, '2021-06-01'),
(4, 'Suman', 'Patel', 'suman.patel@example.com', 'Finance', 60000.00, '2018-07-30'),
(5, 'Kavita', 'Rao', 'kavita.rao@example.com', 'HR', 47000.00, '2020-11-10'),
(6, 'Amit', 'Gupta', 'amit.gupta@example.com', 'Marketing', 52000.00, '2020-09-25'),
(7, 'Neha', 'Desai', 'neha.desai@example.com', 'IT', 48000.00, '2019-05-18'),
(8, 'Rahul', 'Kumar', 'rahul.kumar@example.com', 'IT', 53000.00, '2021-02-14'),
(9, 'Anjali', 'Mehta', 'anjali.mehta@example.com', 'Finance', 61000.00, '2018-12-03'),
(10, 'Vijay', 'Nair', 'vijay.nair@example.com', 'Marketing', 50000.00, '2020-04-19');

select * from employees;

Insert into employees(fname, lname, email, dept)
values
('Priye', 'Singh', 'priyasingh@example.com', 'HR');


select * from employees order by fname;

select count(*) from employees;

select dept , count(*) from employees group by dept;

select dept , sum(salary) from employees group by dept;

select substring ('Hello Buddy!', 7); 