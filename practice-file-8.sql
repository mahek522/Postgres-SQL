--View

create view billing_info as
select c.cust_name,
o.ord_date,
p.p_name,
p.price,
oi.quantity,
(oi.quantity * p.price) as Total_price
from order_items oi
join products p on oi.p_id=p.p_id
join orders o on o.ord_id=oi.ord_id
join customers c on o.cust_id = c.cust_id;
	
select coalesce(p_name, 'Total') as product_name,
sum(Total_price) as Amount
from billing_info
group by 
rollup(p_name) order by amount;

