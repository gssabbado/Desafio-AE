with card_type as (
    select * from {{ ref('stg_creditcard') }}
),

final as (
    select
        creditcard_pk,
        card_type

    from card_type
)

select * from final