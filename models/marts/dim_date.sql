-- models/marts/dim_date.sql

with date_spine as (

    -- Use the date_spine macro to generate a continuous list of dates
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('" ~ var('start_date') ~ "' as date)",
        end_date="cast('" ~ var('end_date') ~ "' as date)"
    ) }}

),

final as (

    select
        cast(date_day as date) as date_day,
        cast(to_char(date_day, 'YYYYMMDD') as int) as date_pk,

        extract(year from date_day) as year,
        extract(month from date_day) as month,
        extract(day from date_day) as day,
        extract(quarter from date_day) as quarter,
        extract(dayofweek from date_day) as day_of_week,
        to_char(date_day, 'Month') as month_name,
        to_char(date_day, 'Day') as day_name

    from date_spine
)

select * from final