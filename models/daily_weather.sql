with daily_weather AS (

select

date(time) as daily_weather,
weather,
temp,
pressure,
hemidity,
clouds

from {{ source('DEMO', 'weather') }}
where daily_weather is not NULL

),
daily_weather_agg as (


select
daily_weather,
weather, 
round(avg(temp),2) as avg_temp,
round(avg(pressure),2) as avg_pressure,
round(avg(hemidity),2) as avg_humidity,
round(avg(clouds),2) as avg_cloud
from daily_weather
group by daily_weather, weather

qualify row_number() over (partition by daily_weather order by count(weather) desc) =1

)

select * from daily_weather_agg