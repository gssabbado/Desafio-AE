with source as (

    select * from {{source('adventure_works','SALES_CREDITCARD')}}

),

renamed as (

select 

    CreditCardID as creditcard_id,
    CardType as card_type


from source
)

select * from renamed