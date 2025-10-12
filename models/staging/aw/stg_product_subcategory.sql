with source as (

    select * from {{source('adventure_works','PRODUCTION_PRODUCTSUBCATEGORY')}}

),

renamed as (

select 

    cast(ProductSubcategoryID as int) as product_subcategory_pk,
    cast(ProductCategoryID as int) as product_category_fk,
    cast(Name as string) as product_subcategory_name



from source
)

select * from renamed
