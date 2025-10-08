with source as (

    select * from {{source('adventure_works','SALES_CUSTOMER')}}

),

renamed as (

select 

    cast(CustomerID as int) as customer_id,
    cast(PersonID as int) as person_id,
    cast(StoreID as int) as store_id,
    cast(TerritoryID as int) as territory_id


from source
)

select * from renamed