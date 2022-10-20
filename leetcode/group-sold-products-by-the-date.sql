select sell_date,
	count(distinct(product)) as num_sold,
	group_concat(distinct(sell_date)) as products
from activities
group by sell_date
order by sell_date
