-- import models
with customer as (
    select * from {{ ref('stg_customer')}}
),

person as (
    select * from {{ ref('stg_person')}}
),


-- transformations
joined as (
    select
        customer.customer_pk,
        person.person_type as person_type,
        person.person_name

        from customer
        left join person on customer.person_fk = person.person_pk

)
select * from joined