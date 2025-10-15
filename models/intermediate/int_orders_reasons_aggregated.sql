with reason as (
    select * from {{ ref('stg_sales_reason')}}
),

reason_header as (
    select * from {{ ref('stg_sales_order_header_sales_reason')}}
),

 joined as (
    select distinct
        reason_header.sales_order_fk as sales_order_pk,
        listgg(reason.reason_name, ', ') within group (order by reason_name) over (partition by reason_header.sales_order_fk) as reason_name_concat,
        listgg(reason.reason_type, ', ') within group (order by reason_type) over (partition by reason_header.sales_order_fk) as reason_type_concat
    
    from reason_header
    left join reason on reason_header.sales_order_fk = reason.sales_order_pk
 )

select * from joined

