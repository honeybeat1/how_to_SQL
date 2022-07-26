select (months*salary) as earnings, count(employee_id)
from employee
group by 1
order by 1 DESC
LIMIT 1
