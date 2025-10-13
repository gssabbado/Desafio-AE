with customers as (
    select * from {{ ref('int_customer') }}
),

final as (
    select

        customer_pk,
        person_fk,
        store_fk,
        territory_fk,

        person_type,
        person_name,
        store_name


    from customers
)

select * from final