select customer_number
from orders
group by customer_number
order by count(order_number) DESC
limit 1
