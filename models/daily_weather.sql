WITH daily_weather as (

SELECT *
FROM {{ source('DEMO', 'WEATHER')}}
WHERE CITYNAME IS NOT NULL
limit 100
)

select * from daily_weather
