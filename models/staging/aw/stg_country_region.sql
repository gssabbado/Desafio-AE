with source as (

    select * from {{source('adventure_works','PERSON_COUNTRYREGION')}}

),

renamed as (

select 

    cast(CountryRegionCode as varchar(2)) as country_region_pk,
    cast(Name as string) as country_region_name

from source
)

select * from renamed

