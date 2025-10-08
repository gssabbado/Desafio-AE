with source as (

    select * from {{source('adventure_works','PERSON_PERSON')}}

),

renamed as (

select 

    cast(BusinessEntityID as int) as person_id,
    cast(PersonType as varchar(2)) as person_type,
    cast(FirstName as string) as first_name,
    cast(MiddleName as string) as middle_name,
    cast(LastName as string) as last_name


from source
)

select * from renamed