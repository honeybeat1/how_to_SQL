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


select h.hacker_id, h.name, count(*)
from Hackers h
join Challenges c
on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name
having count(*) < 50
order by count(*) DESC, h.hacker_id

(select max(counted) from(
                    select count(*) as counted
                    from Hackers h
                    join Challenges c
                    on h.hacker_id = c.hacker_id
                    group by h.hacker_id)as count_table)

select h.hacker_id, h.name, count(*)
from Hackers h
join Challenges c on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name
having count(*) in (select counted
                    from (select h.hacker_id, count(*) as counted
                    from Hackers h
                    join Challenges c
                    on h.hacker_id = c.hacker_id
                    group by h.hacker_id) as count_table
                    group by counted
                    having count(hacker_id) = 1)
order by count(*) DESC


select h.hacker_id, h.name, count(*) as cnt
from Hackers h
join Challenges c on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name
having cnt in (select count_table.counted
                    from (select c.hacker_id, count(*) as counted
                          from Challenges c
                          group by c.hacker_id) as count_table
                    group by count_table.counted
                    having count(*) = 1)
order by cnt DESC
