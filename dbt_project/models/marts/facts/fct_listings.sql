{{
    config(
        materialized='table'
    )
}}

with properties as (
    select * from {{ ref('dim_properties') }}
),

price_changes as (
    select
        property_id,
        count(*) as price_change_count,
        count(*) filter (where change_type = 'decrease') as price_decrease_count,
        count(*) filter (where change_type = 'increase') as price_increase_count,
        min(price) as lowest_price,
        max(price) as highest_price,
        max(price) - min(price) as price_range
    from {{ ref('stg_price_history') }}
    group by property_id
),

final as (
    select
        p.property_id,
        p.property_address,
        p.neighborhood_id,
        p.neighborhood_name,
        p.property_type_id,
        p.property_type_name,
        p.listing_agent_id,
        p.listing_agent_name,
        p.listing_status,

        -- Property attributes
        p.bedrooms,
        p.bathrooms,
        p.square_feet,
        p.lot_size_sqft,
        p.year_built,
        p.garage_spaces,
        p.feature_count,

        -- Pricing
        p.list_price,
        p.price_per_sqft,
        p.hoa_monthly,
        p.property_tax_annual,

        -- Price history metrics
        coalesce(pc.price_change_count, 1) as price_change_count,
        coalesce(pc.price_decrease_count, 0) as price_decrease_count,
        coalesce(pc.price_increase_count, 0) as price_increase_count,
        coalesce(pc.highest_price, p.list_price) as original_list_price,
        coalesce(pc.lowest_price, p.list_price) as lowest_list_price,
        coalesce(pc.price_range, 0) as total_price_reduction,

        -- Market performance
        p.days_on_market,
        case
            when p.days_on_market <= 7 then 'hot'
            when p.days_on_market <= 30 then 'normal'
            when p.days_on_market <= 90 then 'slow'
            else 'stale'
        end as market_velocity,

        -- Listing timeline
        p.listing_date,
        extract(year from p.listing_date) as listing_year,
        extract(month from p.listing_date) as listing_month,
        extract(quarter from p.listing_date) as listing_quarter,
        to_char(p.listing_date, 'YYYY-MM') as listing_year_month,

        -- Neighborhood context
        p.neighborhood_walkability_score,
        p.neighborhood_median_income,

        -- Metadata
        p.created_at,
        p.updated_at

    from properties p
    left join price_changes pc on p.property_id = pc.property_id
)

select * from final
