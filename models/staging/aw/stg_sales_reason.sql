with source as (

    select * from {{source('adventure_works','SALES_SALESREASON')}}

),

renamed as (

select 

    SalesReasonID as sales_reason_id,
    Name as sales_reason_name,
    ReasonType as reason_type



from source
)

select * from renamed