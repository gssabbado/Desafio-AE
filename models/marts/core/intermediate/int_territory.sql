with address as (
    select * from {{ ref('stg_address')}}
),

country_region as (
    select * from {{ ref('stg_country_region')}}
),

state_province as (
    select * from {{ ref('stg_state_province')}}
),

territory as (
    select * from {{ ref('stg_sales_territory')}}
)


, joined as (
    select
        address.address_id,
        address.address_name,
        address.city,
        country_region.country_region_name,
        state_province.state_province_id,
        state_province.state_province_name,
        territory.territory_id,
        territory.territory_name,
        territory.country_region_code,
        territory.territory_group,
        territory.sales_ytd,
        territory.sales_last_year,
        territory.cost_ytd,
        territory.cost_last_year
        from territory
        left join state_province on territory.territory_id = state_province.territory_id
        left join address on state_province.state_province_id = address.state_province_id        
        left join country_region on territory.country_region_code = country_region.country_region_code
)
select * from joined
