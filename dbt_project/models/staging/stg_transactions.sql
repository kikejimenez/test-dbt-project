with source as (
    select * from {{ source('raw', 'transactions') }}
),

renamed as (
    select
        transaction_id,
        property_id,
        buyer_id,
        seller_id,
        buyer_agent_id,
        seller_agent_id,
        sale_price,
        closing_date,
        contract_date,
        financing_type,
        earnest_money,
        closing_costs,
        is_cash_sale,
        created_at,
        updated_at
    from source
)

select * from renamed
