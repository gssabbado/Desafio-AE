with source as (

    select * from {{source('adventure_works','SALES_SALESORDERDETAIL')}}

),

renamed as (

select 

    SalesOrderID as sales_order_id,
    SalesOrderDetailID as sales_order_detail_id,
    OrderQty as quantity,
    ProductID as product_id,
    UnitPrice as unit_price,
    UnitPriceDiscount as unit_price_discount


from source
)

select * from renamed