-- between으로 join하기, select if()절 사용하기
select if(g.grade < 8, Null, s.Name), g.grade, s.Marks
from students s
join Grades g 
on s.Marks between g.Min_Mark and g.Max_Mark
order by g.grade DESC, s.Name, s.Marks
