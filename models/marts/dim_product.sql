with product as (
    select * from {{ ref('int_products') }}
),

final as (
    select

        product_pk,
        product_category_pk,
        product_subcategory_fk,

        product_name,
        category_name,
        subcategory_name,
        standard_cost,
        list_price

    from product
)

select * from final