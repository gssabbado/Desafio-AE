with orders as (
    select * from {{ref('int_orders')}}
),
credit_card as (
    select * from {{ref('stg_creditcard')}}
),
reason as (
    select * from {{ ref('stg_sales_reason')}}
),
reason_header as (
    select * from {{ref('stg_sales_order_header_sales_reason')}}
)

, joined as (
    select
        order_pk,
        sales_order_pk,
        creditcard_pk,
        sales_reason_pk,
        territory_fk,
        customer_fk,
        order_date,
        quantity,
        unit_price,
        unit_price_discount,
        status,
        tax_amt,
        freight,
        sales_reason_name,
        reason_type,
        card_type

        from orders
        left join credit_card on creditcard_fk = creditcard_pk
        left join reason_header on sales_order_pk = reason_header.sales_order_fk
        left join reason on reason_header.sales_reason_fk = sales_reason_pk
        
), 

metrics as (
    select
        order_pk,
        creditcard_pk,
        sales_reason_pk,
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
        sales_reason_name,
        reason_type,
        card_type

        from joined

)

select * from metrics
