with order as (
    select * from {{ref('int_reason')}}
),

sales as (
    select * from {{ref('int_sales')}}
)

, joined as (
    select
        order.sales_order_id,
        count(distinct order.sales_order_id) as num_orders,
        sum(order.quatity) as purchase_amount,
        sum(order.unit_price * order.quantity) as net_sales_per_product,
        sales.card_type,
        order.reason_type,
        sales.order_date,
        



    from order
    

)

/* tables used
with reason as (
    select * from {{ ref('stg_sales_reason')}}
),

reason_header as (
    select * from {{ref('stg_sales_order_header_sales_reason')}}
),

detail as (
    select * from {{ref('stg_sales_order_detail')}}
)

, joined as (
    select
        reason_header.sales_order_id,
        reason.sales_reason_id,
        reason.sales_reason_name,
        reason.reason_type,
        detail.quantity,
        detail.product_id,
        detail.unit_price,
        detail.unit_price_discount,

        from reason
        left join reason_header on reason.sales_reason_id = reason_header.sales_reason_id
        left join detail on reason_header.sales_order_id = detail.sales_order_id
        
)
select * from joined

,
with header as (
    select * from {{ref('stg_sales_order_header')}}
),
credit_card as (
    select * from {{ref('stg_creditcard')}}
)

, joined as (
    select
        credit_card.creditcard_id,
        credit_card.card_type,
        header.sales_order_id,
        header.order_date,
        header.due_date,
        header.ship_date,
        header.status,
        header.online_order_flag,
        header.territory_id,
        header.sub_total,
        header.tax_amt,
        header.freight,
        header.total_due,

        from header
        left join credit_card on header.creditcard_id = credit_card.creditcard_id

        
)
select * from joined


*/