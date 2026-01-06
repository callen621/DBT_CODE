WITH daily_weather AS (
    SELECT
        DATE(time) AS daily_weather,
        weather
    FROM {{ source('DEMO', 'WEATHER') }}
    WHERE cityname IS NOT NULL
),

weather_counts AS (
    SELECT
        daily_weather,
        weather,
        COUNT(*) AS weather_count
    FROM daily_weather
    GROUP BY daily_weather, weather
),

ranked_weather AS (
    SELECT
        daily_weather,
        weather,
        count(distinct weather),
        ROW_NUMBER() OVER (
            PARTITION BY daily_weather
            ORDER BY weather_count DESC
        ) AS row_number
    FROM weather_counts
),

final AS (
    SELECT *
    FROM ranked_weather
)

SELECT *
FROM final


