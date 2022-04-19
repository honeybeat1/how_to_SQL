select ct.contest_id, ct.hacker_id, ct.name,
ifnull(sum(v.total_views), 0) as sum_tv,
ifnull(sum(v.total_unique_views),0) as sum_tuv,
ifnull(sum(s.total_submissions), 0) as sum_ts,
ifnull(sum(s.total_accepted_submissions), 0) as sum_tas
from Contests ct
left join Colleges c on ct.contest_id = c.contest_id
left join Challenges cl on cl.college_id = c.college_id
left join View_Stats v on v.challenge_id = cl.challenge_id
left join Submission_Stats s on s.challenge_id = cl.challenge_id
group by ct.contest_id, ct.hacker_id, ct.name
having sum_tv + sum_tuv + sum_ts + sum_tas > 0
order by ct.contest_id
