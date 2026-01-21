{{
    config(
        materialized='table'
    )
}}

with price_history as (
    select * from {{ ref('stg_price_history') }}
),

properties as (
    select
        property_id,
        property_address,
        neighborhood_name,
        property_type_name,
        listing_agent_name
    from {{ ref('dim_properties') }}
),

price_with_lag as (
    select
        ph.*,
        lag(ph.price) over (partition by ph.property_id order by ph.change_date) as previous_price
    from price_history ph
),

final as (
    select
        pwl.price_history_id,
        pwl.property_id,
        p.property_address,
        p.neighborhood_name,
        p.property_type_name,
        p.listing_agent_name,

        pwl.change_date,
        pwl.change_type,
        pwl.change_reason,
        pwl.price as new_price,
        pwl.previous_price,

        -- Calculate change metrics
        case
            when pwl.previous_price is not null then pwl.price - pwl.previous_price
            else 0
        end as price_change_amount,

        case
            when pwl.previous_price is not null and pwl.previous_price > 0
            then round((pwl.price - pwl.previous_price) / pwl.previous_price * 100, 2)
            else 0
        end as price_change_pct,

        -- Time dimensions
        extract(year from pwl.change_date) as change_year,
        extract(month from pwl.change_date) as change_month,
        extract(quarter from pwl.change_date) as change_quarter,
        to_char(pwl.change_date, 'YYYY-MM') as change_year_month,
        extract(dow from pwl.change_date) as day_of_week,

        -- Metadata
        pwl.created_at

    from price_with_lag pwl
    left join properties p on pwl.property_id = p.property_id
)

select * from final
