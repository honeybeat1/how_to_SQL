select name
from salesperson
where name not in
(select s.name
from orders o
join company c on c.com_id = o.com_id
right join salesperson s on s.sales_id = o.sales_id
where c.name = 'RED')
