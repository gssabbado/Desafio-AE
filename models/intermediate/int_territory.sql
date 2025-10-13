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
        territory.territory_pk,
        address.address_pk,
        state_province.state_province_pk,
        territory.country_region_fk,
        territory.sales_ytd,
        territory.sales_last_year,
        territory.cost_ytd,
        territory.cost_last_year,
        territory.territory_group,
        territory.territory_name,
        country_region.country_region_name,
        state_province.state_province_name,
        address.city,
        address.address_name
        
        from territory
        left join state_province on territory.territory_pk = state_province.territory_fk
        left join address on state_province.state_province_pk = address.state_province_fk        
        left join country_region on territory.country_region_fk = country_region.country_region_pk
)
select * from joined
