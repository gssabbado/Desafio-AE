-- import models
with product as (
    select * from {{ ref('stg_product')}}
),

category as (
    select * from {{ ref('stg_product_category')}}
),

subcategory as (
    select * from {{ ref('stg_product_subcategory')}}
)

-- transformations
, joined as (
    select
        product.product_pk,
        category.product_category_pk,
        product.product_subcategory_fk,
        product.product_name,
        product.standard_cost,
        product.list_price,
        category.product_category_name as category_name,
        subcategory.product_subcategory_name as subcategory_name
        from product
        left join subcategory on product.product_subcategory_fk = subcategory.product_subcategory_pk
        left join category on subcategory.product_category_fk = category.product_category_pk        
        
)
select * from joined
