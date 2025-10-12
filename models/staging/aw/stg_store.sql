with source as (

    select * from {{source('adventure_works','SALES_STORE')}}

),

renamed as (

select 

    cast(BusinessEntityID as int) as store_pk,
    cast(Name as string) as store_name



from source
)

select * from renamed
