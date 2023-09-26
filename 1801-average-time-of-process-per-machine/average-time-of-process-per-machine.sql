# Write your MySQL query statement below
/*
with cte1 as(
    select machine_id,
    process_id,
    SUM(case when activity_type='end' then timestamp 
          when activity_type='start' then -1*timestamp end) as process_duration
    from activity
    group by machine_id,
    process_id
)
select
machine_id,
ROUND(SUM(process_duration)/count(distinct process_id), 3) as processing_time
from cte1
group by machine_id
*/

# Shorter Solution: straightaway calculate avg()

select 
machine_id,
ROUND(SUM(case when activity_type='end' then timestamp 
         when activity_type='start' then -1*timestamp end)/count(distinct process_id), 3) as processing_time
from activity
group by machine_id    
 