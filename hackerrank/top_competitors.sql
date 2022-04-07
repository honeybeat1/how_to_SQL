select h.hacker_id, h.name
from submissions s
join hackers h on s.hacker_id = h.hacker_id
join challenges c on c.challenge_id = s.challenge_id
join difficulty d on d.difficulty_level = c.difficulty_level
where s.score = d.score
group by h.name, h.hacker_id
having count(*) > 1
order by count(*) DESC, h.hacker_id
