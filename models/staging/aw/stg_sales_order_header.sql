with source as (

    select * from {{source('adventure_works','SALES_SALESORDERHEADER')}}

),

renamed as (

select 


    cast(SalesOrderID as int) as sales_order_id,
    cast(OrderDate as date) as order_date,
    cast(DueDate as date) as due_date,
    cast(ShipDate as date) as ship_date,
    cast(Status as string) as status,
    cast(OnlineOrderFlag as boolean) as online_order_flag,
    cast(TerritoryID as int) as territory_id,
    cast(BilltoAddressID as int) as bill_to_address_id,
    cast(CreditCardID as int) as creditcard_id,
    cast(Subtotal as int) as sub_total,
    cast(TaxAmt as numeric(18,6)) as tax_amt,
    cast(Freight as numeric(18,6)) as freight,
    cast(TotalDue as numeric(18,6)) as total_due
    


from source
)

select * from renamed

