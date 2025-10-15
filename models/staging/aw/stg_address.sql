with source as (

    select * from {{source('adventure_works','PERSON_ADDRESS')}}

),

renamed as (

select 

    cast(AddressID as int) as address_pk,
    cast(StateProvinceID as int) as state_province_fk,
    cast(City as string) as city,
    cast(AddressLine1 as string) as address_name,
    -- cast(AddressLine2 as string) as address_name2,
    -- cast(PostalCode as string) as postal_code,
    -- cast(SpatialLocation as string) as spatial_location,
    
from source
)

select * from renamed

