select s.name
from friends f
left join students s on s.id = f.id
left join packages p on p.id = s.id
left join packages p1 on f.friend_id = p1.id
where p1.salary > p.salary
order by p1.salary
