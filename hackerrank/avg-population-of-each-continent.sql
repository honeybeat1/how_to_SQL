select c.continent, floor(avg(ci.population))
from country c 
join city ci on c.code = ci.countrycode
group by c.continent
