-- import models
with customer as (
    select * from {{ ref('stg_customer')}}
),

person as (
    select * from {{ ref('stg_person')}}
),

store as (
    select * from {{ ref('stg_store')}}
)

-- transformations
, joined as (
    select
        customer.customer_pk,
        customer.person_fk,
        customer.store_fk,
        customer.territory_fk,
        person.person_type as person_type,
        person.person_name,
        store.store_name
        from customer
        left join person on customer.person_fk = person.person_pk
        left join store on customer.store_fk = store.store_pk        
        
)
select * from joined
