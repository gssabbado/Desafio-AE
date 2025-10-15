with customers as (
    select * from {{ ref('int_customer') }}
),

final as (
    select

        customer_pk,
        person_name

    from customers
)

select * from final