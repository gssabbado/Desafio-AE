with source as (

    select * from {{source('adventure_works','PERSON_ADDRESS')}}

),

renamed as (

select 

    "AddressID" as address_id,
    "AddressLine1" as address_name,
    "City" as city,
    "StateProvinceID" as state_province_id

from source
)

select * from renamed