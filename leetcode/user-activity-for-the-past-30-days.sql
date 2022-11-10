select activity_date as day, 
    count(distinct user_id) as active_users
from activity
where (to_days('2019-07-27') - to_days(activity_date) < 30)
and (-1 < to_days('2019-07-27') - to_days(activity_date))
group by activity_date
