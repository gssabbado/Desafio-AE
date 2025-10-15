-- import models
with header as (
    select * from {{ref('stg_sales_order_header')}}
),
detail as (
    select * from {{ref('stg_sales_order_detail')}}
)

-- transformations
, joined as (
    select
        {{ dbt_utils.generate_surrogate_key(['sales_order_pk', 'sales_order_detail_pk'])}} 
            as order_pk,
        detail.sales_order_detail_pk,
        header.sales_order_pk,
        detail.product_fk,
        header.territory_fk,
        header.customer_fk,
        header.creditcard_fk,
        header.order_date,
        header.due_date,
        header.ship_date,        
        detail.quantity,
        header.has_online_order,
        case
            when sales_order_detail.unit_price_discount > 0 the true
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
