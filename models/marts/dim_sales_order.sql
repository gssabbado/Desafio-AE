with order as (
    select * from {{ ref('int_reason') }}
),

final as (
    select

        sales_order_id,
        sales_reason_id,
        product_id,

        sales_reason_name,
        reason_type,
        quantity,
        unit_price,
        unit_price_discount

    from product
)

select * from final