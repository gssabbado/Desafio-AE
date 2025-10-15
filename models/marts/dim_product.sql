with product as (
    select * from {{ ref('int_products') }}
),

final as (
    select

        product_pk,

        product_name,
        category_name,
        subcategory_name,

    from product
)

select * from final