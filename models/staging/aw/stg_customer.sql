with source as (

    select * from {{source('adventure_works','SALES_CUSTOMER')}}

),

renamed as (

select 

    cast(CustomerID as int) as customer_pk,
    cast(PersonID as int) as person_fk,
    --cast(StoreID as int) as store_fk,
    --cast(TerritoryID as int) as territory_fk


from source
)

select * from renamed