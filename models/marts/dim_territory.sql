with territory as (
    select * from {{ ref('int_territory') }}
),

final as (
    select

        territory_pk,
        address_pk,
        state_province_pk,
        country_region_fk,
        sales_ytd,
        sales_last_year,
        cost_ytd,
        cost_last_year,
        territory_group,
        territory_name,
        country_region.country_region_name,
        state_province_name,
        city,
        address_name

    from territory
)

select * from final