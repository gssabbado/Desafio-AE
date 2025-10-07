with source as (

    select * from {{source('adventure_works','PERSON_STATEPROVINCE')}}

),

renamed as (

select 

    StateProvinceID as state_province_id_id,
    Name as state_province_name,
    CountryRegionCode as country_region_id,
    TerritoryID as territory_id



from source
)

select * from renamed