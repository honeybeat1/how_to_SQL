select w.id, wp.age, w.coins_needed, w.power from wands w
join wands_property wp
on w.code = wp.code
where wp.is_evil = 0
AND w.coins_needed = (select min(coins_needed)
                       from wands w1
                       join wands_property wp1
                       on w1.code = wp1.code
                       where w.power = w1.power AND wp.age = wp1.age
                       group by w1.power, wp1.age
                      )
order by w.power DESC, wp.age DESC
