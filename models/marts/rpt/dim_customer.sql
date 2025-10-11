with customers as (
    select * from {{ ref('int_customer') }}
),

final as (
    select

        customer_id,
        person_id,
        store_id,
        territory_id,

        person_type,
        first_name,
        middle_name,
        last_name,

        first_name || ' ' || last_name as full_name,


        store_name

    from customers
)

select * from final