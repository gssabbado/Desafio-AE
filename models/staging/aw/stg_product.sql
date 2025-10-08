with source as (

    select * from {{source('adventure_works','PRODUCTION_PRODUCT')}}

),

renamed as (

select 

    cast(ProductID as int) as product_id,
    cast(Name as string) as product_name,
    cast(ProductNumber as string) as product_number,
    cast(ProductSubcategoryID as string) as product_subcategory_id,
    cast(StandardCost as numeric(18,2)) as standard_cost,
    cast(ListPrice as numeric) as list_price,


from source
)

select * from renamed