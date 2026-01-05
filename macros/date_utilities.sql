
-- macros/date_util.sql
{% macro get_season(date_column) %}
    CASE 
        WHEN EXTRACT(MONTH FROM {{ date_column }}) IN (12, 1, 2) THEN 'WINTER'
        WHEN EXTRACT(MONTH FROM {{ date_column }}) IN (3, 4, 5) THEN 'SPRING'
        WHEN EXTRACT(MONTH FROM {{ date_column }}) IN (6, 7, 8) THEN 'SUMMER'
        ELSE 'AUTUMN'
    END
{% endmacro %}

{% macro date_type(date_column) %}
    CASE
        WHEN DAYNAME({{ date_column }}) IN ('Sat', 'Sun') THEN 'WEEKEND'
        ELSE 'BUSINESSDAY'
    END
{% endmacro %}