with source as (

    select * from {{source('adventure_works','PERSON_PERSON')}}

),

renamed as (

select 

    cast(BusinessEntityID as int) as person_pk,
    cast(PersonType as varchar(2)) as person_type,
    FirstName || ' ' || LastName as person_name
    --cast(FirstName as string) as first_name,
    --cast(MiddleName as string) as middle_name,
    --cast(LastName as string) as last_name,
    --cast(EmailPromotion as string) as email,
    


from source
)

select * from renamed