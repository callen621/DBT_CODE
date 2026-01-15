WITH CTE as (

SELECT 
t.*,
w.*
FROM 
{{ ref('trip_fact') }} t
left join {{ ref('daily_weather') }} w
on t.TRIP_DATE = w.daily_weather
order by trip_date desc




)

select * from CTE