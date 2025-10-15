with territory as (
    select * from {{ ref('int_territory') }}
),

final as (
    select

        address_pk,
        state_province_code,
        state_province_name,
        country_region_name,
        city,
        address_name

    from territory
)

select * from final