set @index = 0;
set @index1 = 0;
select distinct f.X, f.Y
from (select X, Y, @index:= @index+1 as row_index from functions)f
inner join(select X, Y, @index1:= @index1+1 as row_index1 from functions)f1
on f.X = f1.Y
where f.Y = f1.X and f.X <= f.Y and row_index != row_index1
order by f.X
