{% macro GET_SEASON(X) %}
    case
        when month(to_timestamp({{ X }})) in (12, 1, 2)
        then 'WINTER'
        when month(to_timestamp({{ X }})) in (3, 4, 5)
        then 'SPRING'
        when month(to_timestamp({{ X }})) in (6, 7, 8)
        then 'SUMMER'
        else 'AUTUMN'
    end
{% endmacro %}

{% macro DAY_TYPE(X) %}
    case
        when dayname(to_timestamp({{ X }})) in ('Sat', 'Sun')
        then 'WEEKEND'
        else 'BUSINESSDAY'
    end
{% endmacro %}
