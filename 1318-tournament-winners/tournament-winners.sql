# Write your MySQL query statement below
With score_union as(
    select first_player as player, first_score as score
    from matches
    UNION ALL
    select second_player as player, second_score as score
    from matches
)
,tot_score as(
    select 
    player,
    p.group_id,
    SUM(score) as sum_score,
    DENSE_RANK() over(partition by p.group_id order by sum(score) desc, player) as score_rank
    from score_union s join players p
    on s.player=p.player_id
    group by p.group_id, s.player
)
select 
group_id,
player as player_id
from tot_score
where score_rank=1