with source as (

    select * from {{source('adventure_works','SALES_SALESORDERHEADERSALESREASON')}}

),

renamed as (

select 

    cast(SalesOrderID as int) as sales_order_id,
    cast(SalesReasonID as int) as sales_reason_id



from source
)

select * from renamed