# Write your MySQL query statement below

With cte as(
    select
    d.name as Department,
    e.name as Employee, 
    e.salary as Salary,
    DENSE_RANK() OVER(partition by d.id order by e.salary desc) as salary_rank
    from employee e join department d
    on e.departmentId=d.id
)
select Department,
Employee,
Salary
from cte
where salary_rank<=3