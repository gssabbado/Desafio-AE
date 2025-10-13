with source as (

    select * from {{source('adventure_works','SALES_CREDITCARD')}}

),

renamed as (

select 

    cast(CreditCardID as int) as creditcard_pk,
    cast(CardType as string) as card_type
    -- cast(CardNumber as string) as card_number
    -- cast(ExpMonth as string) as exp_month
    -- cast(ExpYear as string) as exp_year

from source
)

select * from renamed