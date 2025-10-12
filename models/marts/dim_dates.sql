
with date_spine as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('" ~ var('start_date') ~ "' as date)",
        end_date="cast('" ~ var('end_date') ~ "' as date)"
    ) }}
),

final as (
    select
        cast(date_day as date) as date_day,
        cast(to_char(date_day, 'YYYYMMDD') as int) as date_key,

        extract(year from date_day) as year,
        extract(month from date_day) as month,
        to_char(date_day, 'Month') as month_name,

    from date_spine
)

select * from final