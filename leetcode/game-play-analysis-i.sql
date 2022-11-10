-- date도 min으로 정렬 가능
select player_id, min(event_date) as first_login
from activity
group by player_id
