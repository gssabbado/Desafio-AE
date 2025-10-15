with reason as (
    select * from {{ ref('stg_sales_reason') }}
),

reason_header as (
    select * from {{ ref('stg_sales_order_header_sales_reason') }}
),

final as (
    select
        reason_header.sales_order_fk as sales_order_pk,

        listagg(reason.reason_name, ', ') within group (order by reason.reason_name) as reason_name_concat,
        listagg(reason.reason_type, ', ') within group (order by reason.reason_type) as reason_type_concat
    
    from reason_header
    left join reason on reason_header.sales_reason_fk = reason.sales_reason_pk
    
    group by 1
)

select * from final