-- count distinct, multiple table left join, group by에 대한 문제

select c.company_code, c.founder, 
    count(distinct lm.lead_manager_code),
    count(distinct sm.senior_manager_code),
    count(distinct mg.manager_code),
    count(distinct e.employee_code)
from Company c
left join Lead_Manager lm on c.company_code = lm.company_code
left join Senior_Manager sm on lm.company_code = sm.company_code
left join Manager mg on sm.company_code = mg.company_code
left join Employee e on mg.company_code = e.company_code
group by c.company_code, c.founder
order by c.company_code
