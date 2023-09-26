# Write your MySQL query statement below

select
request_at as Day,
ROUND(count(case when status in ('cancelled_by_driver', 'cancelled_by_client') then t.id end)/count(t.id), 2) as "Cancellation Rate"
from trips t join users c
on t.client_id=c.users_id
join users d
on t.driver_id=d.users_id
where c.banned='No' and d.banned='No'
and t.request_at between '2013-10-01' and '2013-10-03'
group by request_at
