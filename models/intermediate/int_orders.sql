-- import models
with header as (
    select * from {{ ref('stg_sales_order_header') }}
),
detail as (
    select * from {{ ref('stg_sales_order_detail') }}
)

-- transformations
, joined as (
    select
        {{ dbt_utils.generate_surrogate_key(['detail.sales_order_fk', 'detail.sales_order_detail_pk']) }} as order_pk,
        detail.sales_order_detail_pk,
        detail.sales_order_fk,
        detail.product_fk,
        header.address_fk,
        header.customer_fk,
        header.creditcard_fk,
        header.order_date,
        header.due_date,
        header.ship_date,
        detail.quantity,
        header.has_online_order,
        case
            when detail.unit_price_discount > 0 THEN true
            else false
        end as has_discount,
        detail.unit_price,
        detail.unit_price_discount,
        header.tax_amt,
        header.freight,
        header.status

    from header
    inner join detail on header.sales_order_pk = detail.sales_order_fk
)

select * from joined