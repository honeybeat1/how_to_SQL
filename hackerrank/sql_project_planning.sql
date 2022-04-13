-- 나는 변수를 3개 썼는데, 더 좋은 방법이 있을 거 같다.
set @project_id = 0;
set @project_idx = 0;
set @duration = 0;
select p.start_date, m.end_date
from (select end_date, @project_id:= @project_id+1 as pro_index 
      from projects
      where end_date not in (select start_date from projects))as m
join (select start_date, @project_idx:= @project_idx+1 as pro_idx 
      from projects 
      where start_date not in (select end_date from projects))as p
on m.pro_index = p.pro_idx
order by @duration:= m.end_date - p.start_date
