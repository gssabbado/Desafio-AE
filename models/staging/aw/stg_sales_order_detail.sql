with source as (

    select * from {{source('adventure_works','SALES_SALESORDERDETAIL')}}

),

renamed as (

select 

    cast(SalesOrderID as int) as sales_order_id,
    cast(SalesOrderDetailID as int) as sales_order_detail_id,
    cast(OrderQty as int) as quantity,
    cast(ProductID as int) as product_id,
    cast(UnitPrice as numeric(18,6)) as unit_price,
    cast(UnitPriceDiscount as numeric(18,6)) as unit_price_discount


from source
)

select * from renamed