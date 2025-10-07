with source as (

    select * from {{source('adventure_works','PERSON_PERSON')}}

),

renamed as (

select 

    BusinessEntityID as person_id,
    PersonType as person_type,
    FirstName as first_name,
    MiddleName as middle_name,
    LastName as last_name


from source
)

select * from renamed