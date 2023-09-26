# Write your MySQL query statement below
WITH temp AS (
SELECT 
bus_id, 
b.arrival_time, 
capacity, 
count(passenger_id) AS num
FROM Buses b  LEFT JOIN Passengers p  
ON p.arrival_time <= b.arrival_time
GROUP BY bus_id
)
, temp2 as(
SELECT bus_id, 
      capacity, 
      num,
      @passengers_cnt:=LEAST(capacity,num-@accum) as passengers_cnt, 
      @accum:=@accum+@passengers_cnt
FROM temp, (SELECT @accum:= 0, @passengers_cnt:=0)var
)
SELECT bus_id, passengers_cnt 
from temp2
ORDER BY bus_id