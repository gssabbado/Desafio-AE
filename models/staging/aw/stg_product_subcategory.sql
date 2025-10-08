with source as (

    select * from {{source('adventure_works','PRODUCTION_PRODUCTSUBCATEGORY')}}

),

renamed as (

select 

    cast(ProductSubcategoryID as int) as product_subcategory_id,
    cast(ProductCategoryID as int) as product_category_id,
    cast(Name as string) as product_category_name,



from source
)

select * from renamed
