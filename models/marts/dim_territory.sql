with territory as (
    select * from {{ ref('int_territory') }}
),

final as (
    select

        territory_id,
        address_id,
        state_province_id,
        country_region_code,
        
        territory_name,
        territory_group,
        country_region_name,
        state_province_name,
        city,
        address_name

    from territory
)

select * from final