with source as (

    select * from {{source('adventure_works','PERSON_STATEPROVINCE')}}

),

renamed as (

select 

    cast(StateProvinceID as int) as state_province_pk,
    cast(CountryRegionCode as varchar(2)) as country_region_fk,
    cast(StateProvinceCode as string) as state_province_code,
    cast(Name as string) as state_province_name
    -- cast(TerritoryID as int) as territory_fk,



from source
)

select * from renamed