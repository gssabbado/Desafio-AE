with address as (
    select * from {{ ref('stg_address')}}
),

country_region as (
    select * from {{ ref('stg_country_region')}}
),

state_province as (
    select * from {{ ref('stg_state_province')}}
),



, joined as (
    select
        state_province.state_province_pk,
        address.address_pk,
        state_province.state_province_code,
        country_region.country_region_name,
        state_province.state_province_name,
        address.city,
        address.address_name
        
        from state_province
        left join address on state_province.state_province_pk = address.state_province_fk        
        left join country_region on state_province.country_region_fk = country_region.country_region_pk
)
select * from joined
