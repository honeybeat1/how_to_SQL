select ct.contest_id, ct.hacker_id, ct.name,
ifnull(sum(ss.sum_ts), 0) as sumsum_ts,
ifnull(sum(ss.sum_tas), 0) as sumsum_tas,
ifnull(sum(vs.sum_tv), 0) as sumsum_tv,
ifnull(sum(vs.sum_tuv),0) as sumsum_tuv
from Contests ct
left join Colleges c on ct.contest_id = c.contest_id
left join Challenges cl on cl.college_id = c.college_id
left join (select challenge_id, sum(total_submissions) as sum_ts,
           sum(total_accepted_submissions) as sum_tas
            from Submission_Stats
            group by challenge_id)ss
            on cl.challenge_id = ss.challenge_id
left join (select challenge_id, sum(total_views) as sum_tv,
           sum(total_unique_views) as sum_tuv
            from View_Stats
            group by challenge_id)vs
            on cl.challenge_id = vs.challenge_id
group by ct.contest_id, ct.hacker_id, ct.name
having sumsum_tv + sumsum_tuv + sumsum_ts + sumsum_tas > 0
order by ct.contest_id
