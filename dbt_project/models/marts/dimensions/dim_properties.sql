{{
    config(
        materialized='table'
    )
}}

with properties as (
    select * from {{ ref('stg_properties') }}
),

neighborhoods as (
    select * from {{ ref('stg_neighborhoods') }}
),

property_types as (
    select * from {{ ref('stg_property_types') }}
),

listing_statuses as (
    select * from {{ ref('stg_listing_statuses') }}
),

agents as (
    select * from {{ ref('stg_agents') }}
),

features_agg as (
    select
        pf.property_id,
        string_agg(f.feature_name, ', ' order by f.feature_category, f.feature_name) as features_list,
        count(*) as feature_count
    from {{ ref('stg_property_features') }} pf
    join {{ ref('stg_features') }} f on pf.feature_id = f.feature_id
    group by pf.property_id
),

final as (
    select
        p.property_id,
        p.property_address,
        p.property_city,
        p.property_state,
        p.property_zip_code,
        p.latitude,
        p.longitude,

        -- Neighborhood info
        n.neighborhood_id,
        n.neighborhood_name,
        n.median_income as neighborhood_median_income,
        n.walkability_score as neighborhood_walkability_score,

        -- Property type
        pt.property_type_id,
        pt.property_type_name,

        -- Status
        ls.status_id,
        ls.status_name as listing_status,

        -- Agent info
        a.agent_id as listing_agent_id,
        a.agent_full_name as listing_agent_name,

        -- Property details
        p.year_built,
        p.square_feet,
        p.lot_size_sqft,
        p.bedrooms,
        p.bathrooms,
        p.garage_spaces,
        p.stories,

        -- Pricing
        p.list_price,
        p.hoa_monthly,
        p.property_tax_annual,
        round(p.list_price / nullif(p.square_feet, 0), 2) as price_per_sqft,

        -- Features
        coalesce(fa.features_list, '') as features_list,
        coalesce(fa.feature_count, 0) as feature_count,

        -- Listing info
        p.listing_date,
        p.days_on_market,
        p.property_description,

        -- Metadata
        p.created_at,
        p.updated_at

    from properties p
    left join neighborhoods n on p.neighborhood_id = n.neighborhood_id
    left join property_types pt on p.property_type_id = pt.property_type_id
    left join listing_statuses ls on p.status_id = ls.status_id
    left join agents a on p.listing_agent_id = a.agent_id
    left join features_agg fa on p.property_id = fa.property_id
)

select * from final
