# Write your MySQL query statement below
select
m.employee_id,
m.name,
count(e.employee_id) as reports_count,
ROUND(avg(e.age), 0) as average_age
from employees e left join employees m
on e.reports_to=m.employee_id
where e.reports_to is not null
group by m.employee_id,
m.name
order by m.employee_id
