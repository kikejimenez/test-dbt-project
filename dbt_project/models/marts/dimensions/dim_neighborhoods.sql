{{
    config(
        materialized='table'
    )
}}

with neighborhoods as (
    select * from {{ ref('stg_neighborhoods') }}
),

-- Neighborhood property stats
property_stats as (
    select
        neighborhood_id,
        count(*) as total_listings,
        count(*) filter (where listing_status = 'active') as active_listings,
        count(*) filter (where listing_status = 'sold') as sold_listings,
        avg(list_price) as avg_list_price,
        min(list_price) as min_list_price,
        max(list_price) as max_list_price,
        avg(price_per_sqft) as avg_price_per_sqft,
        avg(square_feet) as avg_square_feet,
        avg(bedrooms) as avg_bedrooms,
        avg(bathrooms) as avg_bathrooms,
        avg(days_on_market) as avg_days_on_market
    from {{ ref('dim_properties') }}
    group by neighborhood_id
),

final as (
    select
        n.neighborhood_id,
        n.neighborhood_name,
        n.city,
        n.state,
        n.zip_code,
        n.median_income,
        n.walkability_score,

        -- Walkability category
        case
            when n.walkability_score >= 90 then 'Walker''s Paradise'
            when n.walkability_score >= 70 then 'Very Walkable'
            when n.walkability_score >= 50 then 'Somewhat Walkable'
            when n.walkability_score >= 25 then 'Car-Dependent'
            else 'Almost All Errands Require a Car'
        end as walkability_category,

        -- Property stats
        coalesce(ps.total_listings, 0) as total_listings,
        coalesce(ps.active_listings, 0) as active_listings,
        coalesce(ps.sold_listings, 0) as sold_listings,
        round(coalesce(ps.avg_list_price, 0), 2) as avg_list_price,
        round(coalesce(ps.min_list_price, 0), 2) as min_list_price,
        round(coalesce(ps.max_list_price, 0), 2) as max_list_price,
        round(coalesce(ps.avg_price_per_sqft, 0), 2) as avg_price_per_sqft,
        round(coalesce(ps.avg_square_feet, 0), 0) as avg_square_feet,
        round(coalesce(ps.avg_bedrooms, 0), 1) as avg_bedrooms,
        round(coalesce(ps.avg_bathrooms, 0), 1) as avg_bathrooms,
        round(coalesce(ps.avg_days_on_market, 0), 0) as avg_days_on_market,

        -- Metadata
        n.created_at

    from neighborhoods n
    left join property_stats ps on n.neighborhood_id = ps.neighborhood_id
)

select * from final
