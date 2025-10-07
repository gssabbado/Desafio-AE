with source as (

    select * from {{source('adventure_works','SALES_SALESORDERHEADER')}}

),

renamed as (

select 

    SalesOrderID as sales_order_id,
    OrderDate as order_date,
    DueDate as due_date,
    ShipDate as ship_date,
    Status as status,
    TerritoryID as territory_id,
    CreditCardID as creditcard_id,
    Subtotal as sub_total,
    TaxAmt as tax_amt,
    Freight as freight,
    TotalDue as total_due
    


from source
)

select * from renamed