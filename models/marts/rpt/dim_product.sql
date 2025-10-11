with product as (
    select * from {{ ref('int_products') }}
),

final as (
    select

        product_id,
        person_id,
        store_id,
        territory_id,

        product_name,
        category_name,
        subcategory_name,
        standard_cost

    from product
)

select * from final