-- models/date_dim.sql
WITH bike_data AS (
    SELECT 
        TO_TIMESTAMP(STARTED_AT) as started_at_ts,
        STARTED_AT
    FROM {{ source('DEMO', 'BIKE') }}
    WHERE STARTED_AT IS NOT NULL
)
SELECT
    STARTED_AT,
    started_at_ts,
    {{ get_season('started_at_ts') }} as season,
    {{ date_type('started_at_ts') }} as day_type
FROM bike_data;