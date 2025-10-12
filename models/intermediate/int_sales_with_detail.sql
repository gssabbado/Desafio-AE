with order as (
    select * from {{ref('int_reason')}}
),

sales as (
    select * from {{ref('int_sales')}}
)

, joined as (
    select


    from order
    

)
