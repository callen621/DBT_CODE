WITH CTE AS (
    SELECT
        TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
        DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
        HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
        DAYNAME(TO_TIMESTAMP(STARTED_AT)) AS DAY_NAME, 
        CASE
            WHEN DAYNAME(TO_TIMESTAMP(STARTED_AT)) IN ('Sat', 'Sun')
            THEN 'WEEKEND'
            ELSE 'BUSINESSDAY'
        END AS DAY_TYPE,
        {{ season('STARTED_AT') }} AS TIME_PERIOD  -- Add alias here

    FROM
        {{ source('DEMO', 'bike') }}
    WHERE STARTED_AT != 'started_at'
)
SELECT 
    * 
FROM CTE