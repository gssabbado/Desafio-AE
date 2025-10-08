with source as (

    select * from {{source('adventure_works','PERSON_ADDRESS')}}

),

renamed as (

select 

    cast(AddressID as int) as address_id,
    cast(AddressLine1 as string) as address_name,
    cast(City as string) as city,
    cast(StateProvinceID as int) as state_province_id

from source
)

select * from renamed

