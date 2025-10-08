with source as (

    select * from {{source('adventure_works','PRODUCTION_PRODUCTCATEGORY')}}

),

renamed as (

select 

    cast(ProductCategoryID as int) as product_category_id,
    cast(Name as string) as product_category_name,



from source
)

select * from renamed
