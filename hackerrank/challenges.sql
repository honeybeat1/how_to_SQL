select h.hacker_id, h.name, count(*) as chal_count
from Hackers h
join Challenges c on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name
having chal_count in (select counted from (
                        select count(*) as counted
                        from Hackers h
                        join Challenges c on h.hacker_id = c.hacker_id
                        group by h.hacker_id)counted_table
                        group by counted
                        having count(counted) = 1)
or chal_count = (select max(counted) from (
                    select count(*) as counted            
                    from Hackers h
                    join Challenges c on h.hacker_id = c.hacker_id
                    group by h.hacker_id)counted_table)
order by chal_count DESC, h.hacker_id
