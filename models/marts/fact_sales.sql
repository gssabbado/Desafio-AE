with sales as (
    select * from {{ ref('int_sales') }}
),

final as (
    select

        sales_order_id,
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