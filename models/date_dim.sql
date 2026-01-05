-- models/date_dim.sql
WITH bike_data AS (
    SELECT 
        TO_TIMESTAMP(started_at) as started_at_ts,
        started_at
    FROM {{ source('DEMO', 'BIKE') }}
    WHERE started_at IS NOT NULL
)
SELECT
    started_at,
    started_at_ts,
    {{ get_season('started_at_ts') }} as season,
    {{ date_type('started_at_ts') }} as day_type
FROM bike_data;