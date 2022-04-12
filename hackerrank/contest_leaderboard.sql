select h.hacker_id, h.name, sum(max_score)
from (select hacker_id, max(score) as max_score
      from Submissions 
      group by hacker_id, challenge_id 
     )m
join Hackers h on m.hacker_id = h.hacker_id
group by h.hacker_id, h.name
having sum(max_score) > 0
order by sum(max_score) DESC, h.hacker_id
