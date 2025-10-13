with orders as (
    select * from {{ref('int_orders')}}
),
credit_card as (
    select * from {{ref('stg_creditcard')}}
),
orders_reason as (
    select * from {{ ref('int_orders_reasons_aggregated')}}
)

, joined as (
    select
        orders.order_pk,
        orders.sales_order_pk,
        credit_card.creditcard_pk,
        orders.territory_fk,
        orders.customer_fk,
        orders.order_date,
        orders.quantity,
        orders.unit_price,
        orders.unit_price_discount,
        orders.status,
        orders.tax_amt,
        orders.freight,
        credit_card.card_type,
        orders_reason.sales_reasons

        from orders
        left join credit_card on creditcard_fk = creditcard_pk
        left join orders_reason on sales_order_pk = orders_reason.sales_order_fk
        
), 

metrics as (
    select
        order_pk,
        creditcard_pk,
        territory_fk,
        customer_fk,
        order_date,
        quantity,
        unit_price,
        unit_price_discount,
        tax_amt,
        freight,
        unit_price * quantity as gross_total,
        unit_price * (1 - unit_price_discount) * quantity as net_total,
        status,
        sales_reasons,
        card_type

        from joined

)

select * from metrics
