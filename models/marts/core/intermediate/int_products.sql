with product as (
    select * from {{ ref('stg_product')}}
),

category as (
    select * from {{ ref('stg_product_category')}}
),

subcategory as (
    select * from {{ ref('stg_product_subcategory')}}
)

, joined as (
    select
        product.product_id,
        product.product_name,
        product.product_subcategory_id,
        product.standard_cost,
        product.list_price,
        category.product_category_id,
        category.product_category_name as category_name,
        subcategory.product_subcategory_name as subcategory_name,
        from product
        left join subcategory on product.product_subcategory_id = subcategory.product_subcategory_id
        left join category on subcategory.product_category_id = category.product_category_id        
        
)
select * from joined
