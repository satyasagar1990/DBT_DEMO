with
    daily_weather_cte as (
        select date(time) as daily_weather, weather, clouds, humidity, pressure, temp
        from {{ source("DEMO", "WEATHER") }}
    ),
    agg_weather_cte as (
        select
            daily_weather,
            weather,
            round(avg(clouds), 2) as avg_clouds,
            round(avg(humidity), 2) as avg_humidity,
            round(avg(pressure), 2) as avg_pressure,
            round(avg(temp), 2) as avg_temp
        from daily_weather_cte
        group by daily_weather, weather
        qualify
            row_number() over (partition by daily_weather order by count(weather) desc)
            = 1
    )
select *
from agg_weather_cte
