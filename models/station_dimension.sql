WITH bike AS (

    SELECT DISTINCT
    Start_statio_id,
    start_station_name,
    start_lat,
    start_lng
  

    FROM {{ source('DEMO', 'bike') }}
    where RIDE_ID != 'ride_id'
  


)

select * from bike