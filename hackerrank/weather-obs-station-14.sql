select truncate(LAT_N, 4)
from station
where LAT_N < 137.2345
order by LAT_N DESC
limit 1
