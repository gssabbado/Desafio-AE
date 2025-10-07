with source as (

    select * from {{source('adventure_works','PERSON_COUNTRYREGION')}}

),

renamed as (

select 

    CountryRegionCode as country_region_id,
    Name as country_region_name

from source
)

select * from renamed

