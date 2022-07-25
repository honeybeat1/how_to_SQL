select ceiling(avg(e.salary) - avg(nt.salary))
from employees as e, 
(select replace(salary, 0, '') as salary
from employees) nt
