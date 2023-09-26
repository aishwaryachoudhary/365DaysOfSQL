# Write your MySQL query statement below
select
s.user_id,
COALESCE(ROUND(count(case when c.action='confirmed' then c.user_id end)/count(c.user_id), 2), 0) as confirmation_rate
from signups s left join confirmations c on s.user_id=c.user_id
group by s.user_id