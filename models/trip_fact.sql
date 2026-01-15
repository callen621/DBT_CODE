WITH trips as (

select
RIDE_ID,
RIDEABLE_TYPE,
DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
START_STATIO_ID,
END_STATION_ID,
MEMBER_CSUAL AS mEMBER_CASUAL,
timestampdiff(second,to_timestamp(started_at), to_timestamp(ended_at)) as trip_duration_seconds
from {{ source('DEMO','bike') }}

where RIDE_ID != 'ride_id'
limit 10
)

select
*
from trips