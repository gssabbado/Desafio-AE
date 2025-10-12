with reason as (
    select * from {{ ref('stg_sales_reason')}}
),

reason_header as (
    select * from {{ ref('stg_sales_order_header_sales_reason')}}
)

select
    reason_header.sales_order_fk,
    -- Use LISTAGG (or ARRAY_AGG) to combine all reasons for one order into a single string
    listagg(reason.sales_reason_name, ', ') as sales_reasons
    
from reason_header
left join reason on reason_header.sales_reason_fk = reason.sales_reason_pk
group by 1 