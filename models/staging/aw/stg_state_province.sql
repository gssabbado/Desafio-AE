with source as (

    select * from {{source('adventure_works','PERSON_STATEPROVINCE')}}

),

renamed as (

select 

    cast(StateProvinceID as int) as state_province_id,
    cast(Name as string) as state_province_name,
    cast(CountryRegionCode as varchar(2)) as country_region_code,
    cast(TerritoryID as int) as territory_id



from source
)

select * from renamed