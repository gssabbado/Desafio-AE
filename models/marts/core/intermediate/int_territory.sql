-- mudar
with customer as (
    select * from {{ ref('stg_customer')}}
),

person as (
    select * from {{ ref('stg_person')}}
),

store as (
    select * from {{ ref('stg_store')}}
)

, joined as (
    select
        customer.customer_id,
        customer.person_id,
        customer.store_id,
        customer.territory_id,
        person.business_entity_id as person_business_entity_id,
        person.person_type as person_type,
        person.first_name,
        person.middle_name,
        person.full_name,
        store.business_entity_id as store_business_entity_id,
        store.store_name
        from customer
        left join person on customer.person_id = person.business_entity_id
        left join store on customer.store_id = store.business_entity_id        
        
)
select * from joined
