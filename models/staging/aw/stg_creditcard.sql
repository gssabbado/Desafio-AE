with source as (

    select * from {{source('adventure_works','SALES_CREDITCARD')}}

),

renamed as (

select 

    cast(CreditCardID as int) as creditcard_id,
    cast(CardType as string) as card_type


from source
)

select * from renamed