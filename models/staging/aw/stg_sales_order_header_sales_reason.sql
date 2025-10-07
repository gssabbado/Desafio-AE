with source as (

    select * from {{source('adventure_works','SALES_SALESORDERHEADERSALESREASON')}}

),

renamed as (

select 

    SalesOrderID as sales_order_id,
    SalesReasonID as sales_reason_id



from source
)

select * from renamed