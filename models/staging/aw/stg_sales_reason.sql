with source as (

    select * from {{source('adventure_works','SALES_SALESREASON')}}

),

renamed as (

select 

    cast(SalesReasonID as int) as sales_reason_id,
    cast(Name as string) as sales_reason_name,
    cast(ReasonType as string) as reason_type



from source
)

select * from renamed