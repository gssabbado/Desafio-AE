with orders as (
    select * from {{ ref('int_reason') }}
),

final as (
    select

        order_pk,
        sales_order_pk,
        sales_order_detail_pk,
        territory_fk,
        customer_fk,
        creditcard_fk,
        order_date,
        quantity,
        unit_price,
        unit_price_discount,
        tax_amt,
        freight,
        status

    from product
)

select * from final