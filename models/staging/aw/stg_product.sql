with source as (

    select * from {{source('adventure_works','PRODUCTION_PRODUCT')}}

),

renamed as (

select 

    ProductID as product_id,
    Name as product_name,
    ProductNumber as product_number,


from source
)

select * from renamed