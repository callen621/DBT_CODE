

WITH CTE AS (

SELECT
TO_TIMESTAMP(STARTED_AT) AS START_TIME,
DATE(TO_TIMESTAMP(STARTED_AT)) AS Start_Date,
HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED,

{{ my_new_project.get_season('STARTED_AT') }} AS SEASON_OF_YEAR,  -- calling the macro when there is more than 1 a common between is required.
{{ my_new_project.date_type('STARTED_AT')}} AS DAY_TYPE 

FROM 
{{ source('DEMO', 'BIKE') }}
WHERE STARTED_AT != 'started_at'


)
SELECT * FROM CTE     --requred by dbt or you get an error