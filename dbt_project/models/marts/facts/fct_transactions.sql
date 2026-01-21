{{
    config(
        materialized='table'
    )
}}

with transactions as (
    select * from {{ ref('stg_transactions') }}
),

properties as (
    select * from {{ ref('dim_properties') }}
),

final as (
    select
        t.transaction_id,
        t.property_id,
        t.buyer_id,
        t.seller_id,
        t.buyer_agent_id,
        t.seller_agent_id,

        -- Dates
        t.contract_date,
        t.closing_date,
        t.closing_date - t.contract_date as days_to_close,

        -- Financial metrics
        t.sale_price,
        p.list_price as original_list_price,
        t.sale_price - p.list_price as price_difference,
        round((t.sale_price - p.list_price) / nullif(p.list_price, 0) * 100, 2) as price_change_pct,
        case
            when t.sale_price > p.list_price then 'over_asking'
            when t.sale_price < p.list_price then 'under_asking'
            else 'at_asking'
        end as sale_vs_asking,

        t.earnest_money,
        t.closing_costs,
        t.financing_type,
        t.is_cash_sale,

        -- Property context
        p.property_type_name,
        p.neighborhood_name,
        p.bedrooms,
        p.bathrooms,
        p.square_feet,
        round(t.sale_price / nullif(p.square_feet, 0), 2) as sale_price_per_sqft,

        -- Commission estimates (buyer + seller side)
        round(t.sale_price * 0.06, 2) as estimated_total_commission,

        -- Time dimensions
        extract(year from t.closing_date) as closing_year,
        extract(month from t.closing_date) as closing_month,
        extract(quarter from t.closing_date) as closing_quarter,
        to_char(t.closing_date, 'YYYY-MM') as closing_year_month,

        -- Metadata
        t.created_at,
        t.updated_at

    from transactions t
    left join properties p on t.property_id = p.property_id
)

select * from final
