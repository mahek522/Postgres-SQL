create table customers(
cust_id serial primary key,
cust_name varchar(100) not null
);

create table orders(
ord_id serial primary key,
ord_date date not null,
price numeric not null,
cust_id integer not null,
foreign key (cust_id) references
customers(cust_id)
);