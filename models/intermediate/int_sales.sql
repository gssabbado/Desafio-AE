with orders as (
    select * from {{ref('int_orders')}}
),

joined as (
    select
        sales_order_detail_pk,
        sales_order_fk,
        creditcard_fk,
        product_fk,
        address_fk,
        customer_fk,
        order_date,
        due_date,
        ship_date,  
        has_online_order,
        has_discount,
        quantity,
        unit_price,
        unit_price_discount,
        status,
        tax_amt,
        freight,

        from orders
        
), 

metrics as (
    select
        sales_order_detail_pk,
        sales_order_fk,
        creditcard_fk,
        product_fk,
        address_fk,
        customer_fk,
        order_date,
        due_date,
        ship_date,  
        has_online_order,
        has_discount,
        quantity,
        unit_price,
        unit_price_discount,
        unit_price * quantity as gross_total,
        unit_price * (1 - unit_price_discount) * quantity as net_total,
        status,
        tax_amt,
        freight

        from joined

)

select * from metrics
