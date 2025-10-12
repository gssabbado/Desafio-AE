--- não vou usar assim
with reason as (
    select * from {{ ref('stg_sales_reason')}}
),

reason_header as (
    select * from {{ref('stg_sales_order_header_sales_reason')}}
)

, joined as (
    select
        {{ dbt_utils.generate_surrogate_key(['sales_reason_pk', 'sales_reason_fk'])}} 
            as reason_pk,
        reason.sales_reason_pk,
        reason_header.sales_order_fk,
        reason.sales_reason_name,
        reason.reason_type


        from reason
        inner join reason_header on reason.sales_reason_pk = reason_header.sales_reason_fk
        
)
select * from joined