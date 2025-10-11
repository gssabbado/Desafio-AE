with reason as (
    select * from {{ ref('stg_sales_reason')}}
),

reason_header as (
    select * from {{ref('stg_sales_order_header_sales_reason')}}
),

order as (
    select * from {{ref('stg_sales_order_detail')}}
)

, joined as (
    select
        reason_header.sales_order_id,
        reason.sales_reason_id,
        reason.sales_reason_name,
        reason.reason_type,
        detail.sales_order_id,
        detail.sales_order_detail_id,
        detail.quantity,
        detail.product_id,
        detail.unit_price,
        detail.unit_price_discount,

        from reason
        left join reason_header on reason.sales_reason_id = reason_header.sales_reason_id
        left join detail on reason_header.sales_order_detail_id = detail.sales_order_detail_id
        
)
select * from joined
