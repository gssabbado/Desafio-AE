with source as (

    select * from {{source('adventure_works','SALES_SALESORDERHEADER')}}

),

renamed as (

select 


    cast(SalesOrderID as int) as sales_order_pk,
    cast(CreditCardID as int) as creditcard_fk,
    cast(ShiptoAdressID as int) as address_fk
    cast(CustomerID as int) as customer_fk,
    cast(OrderDate as date) as order_date,
    cast(DueDate as date) as due_date,
    cast(ShipDate as date) as ship_date,
    cast(Status as string) as status,
    cast(OnlineOrderFlag as boolean) as has_online_order,
    cast(TaxAmt as numeric(18,6)) as tax_amt,
    cast(Freight as numeric(18,6)) as freight,
    --cast(TerritoryID as int) as territory_fk,
    --cast(TotalDue as numeric(18,6)) as total_due
    --cast(BilltoAddressID as int) as bill_to_address_id,
    --cast(Subtotal as int) as sub_total,
    


from source
)

select * from renamed

