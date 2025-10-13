with source as (

    select * from {{source('adventure_works','SALES_SALESORDERHEADERSALESREASON')}}

),

renamed as (

select 

    cast(SalesOrderID as int) as sales_order_fk,
    cast(SalesReasonID as int) as sales_reason_fk



from source
)

select * from renamed