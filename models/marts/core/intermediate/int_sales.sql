with header as (
    select * from {{ref('stg_sales_order_header')}}
),
credit_card as (
    select * from {{ref('stg_creditcard')}}
)

, joined as (
    select
        credit_card.creditcard_id,
        credit_card.card_type,
        header.sales_order_id,
        header.order_date,
        header.due_date,
        header.ship_date,
        header.status,
        header.online_order_flag,
        header.territory_id,
        header.sub_total,
        header.tax_amt,
        header.freight,
        header.total_due,

        from header
        left join credit_card on header.creditcard_id = credit_card.creditcard_id

        
)
select * from joined
