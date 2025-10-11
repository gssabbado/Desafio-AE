with source as (

    select * from {{source('adventure_works','SALES_STORE')}}

),

renamed as (

select 

    cast(BusinessEntityID as int) as business_entity_id,
    cast(Name as string) as store_name



from source
)

select * from renamed
