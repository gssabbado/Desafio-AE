with sales as (
    select * from {{ ref('int_sales') }}
),

final as (
    select
        sales_order_detail_pk,
        sales_order_fk,
        address_fk,
        creditcard_fk,
        customer_fk,
        product_fk,
        order_date,
        due_date,
        ship_date,
        has_online_order,
        has_discount,
        status
        quantity,
        unit_price,
        gross_total,
        unit_price_discount,
        net_total,
        tax_amt,
        freight,

    from sales
)

select * from final