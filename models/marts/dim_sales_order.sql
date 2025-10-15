with reason as (
    select * from {{ ref('int_orders_reasons_aggregated') }}
),

final as (
    select

        sales_order_pk,
        reason_name_concat,
        reason_type_concat

    from reason
)

select * from final