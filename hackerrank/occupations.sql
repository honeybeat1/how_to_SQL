select
    max(case when occupation = 'Doctor' then name else NULL end) as 'doc',
    max(case when occupation = 'Professor' then name else NULL end) as 'prof',
    max(case when occupation = 'Singer' then name else NULL end) as 'sing',
    max(case when occupation = 'Actor' then name else NULL end) as 'act'
from (select *, row_number() over (partition by occupation order by name) rn
    from occupations) rnt
group by rn
