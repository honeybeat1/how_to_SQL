select distinct city
from station
where left(city,1) in ('A', 'E', 'I','O', 'U')
