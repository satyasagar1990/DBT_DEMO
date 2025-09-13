with
    trips_cte as (
        select
            ride_id,
            -- rideable_type,
            date(to_timestamp(started_at)) as trip_date,
            start_statio_id,
            end_station_id,
            timestampdiff(
                second, to_timestamp(started_at), to_timestamp(ended_at)
            ) as trip_duration_in_secs
        from {{ ref('stg_bike') }}
    )
select *
from trips_cte
