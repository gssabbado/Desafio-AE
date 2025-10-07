with source as (

    select * from {{source('adventure_works','SALES_CUSTOMER')}}

),

renamed as (

select 

    CustomerID as customer_id,
    PersonID as person_id,
    StoreID as store_id,
    TerritoryID as territory_id


from source
)

select * from renamed