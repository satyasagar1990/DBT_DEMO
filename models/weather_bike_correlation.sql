with
    weather_bike_cte as (
        select t.*, dw.*
        from {{ ref("trips_fact") }} t
        left join {{ ref("daily_weather") }} dw 
            on t.trip_date = dw.daily_weather
    )
select *
from weather_bike_cte
