with sales as (
    select * from {{ ref('int_sales') }}
),

final as (
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
        gross_total,
        net_total,
        status,
        sales_reason_name,
        reason_type,
        card_type

    from territory
)

select * from final