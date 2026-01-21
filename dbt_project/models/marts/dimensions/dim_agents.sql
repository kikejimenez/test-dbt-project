{{
    config(
        materialized='table'
    )
}}

with agents as (
    select * from {{ ref('stg_agents') }}
),

offices as (
    select * from {{ ref('stg_offices') }}
),

-- Calculate agent performance metrics
agent_listings as (
    select
        listing_agent_id as agent_id,
        count(*) as total_listings,
        count(*) filter (where listing_status = 'active') as active_listings,
        count(*) filter (where listing_status = 'sold') as sold_listings,
        avg(list_price) as avg_list_price
    from {{ ref('dim_properties') }}
    where listing_agent_id is not null
    group by listing_agent_id
),

agent_sales as (
    select
        agent_id,
        sum(sale_count) as total_sales,
        sum(total_volume) as total_sales_volume,
        avg(avg_sale_price) as avg_sale_price
    from (
        select
            buyer_agent_id as agent_id,
            count(*) as sale_count,
            sum(sale_price) as total_volume,
            avg(sale_price) as avg_sale_price
        from {{ ref('stg_transactions') }}
        where buyer_agent_id is not null
        group by buyer_agent_id

        union all

        select
            seller_agent_id as agent_id,
            count(*) as sale_count,
            sum(sale_price) as total_volume,
            avg(sale_price) as avg_sale_price
        from {{ ref('stg_transactions') }}
        where seller_agent_id is not null
        group by seller_agent_id
    ) combined
    group by agent_id
),

final as (
    select
        a.agent_id,
        a.agent_first_name,
        a.agent_last_name,
        a.agent_full_name,
        a.agent_email,
        a.agent_phone,
        a.license_number,
        a.license_expiry,
        a.hire_date,
        a.commission_rate,
        a.is_agent_active,

        -- Office info
        o.office_id,
        o.office_name,
        o.office_city,
        o.office_state,

        -- Calculated metrics
        coalesce(al.total_listings, 0) as total_listings,
        coalesce(al.active_listings, 0) as active_listings,
        coalesce(al.sold_listings, 0) as sold_listings,
        coalesce(asales.total_sales, 0) as total_transactions,
        coalesce(asales.total_sales_volume, 0) as total_sales_volume,
        round(coalesce(asales.avg_sale_price, 0), 2) as avg_sale_price,

        -- Tenure
        extract(year from age(current_date, a.hire_date)) as years_with_company,

        -- Metadata
        a.created_at,
        a.updated_at

    from agents a
    left join offices o on a.office_id = o.office_id
    left join agent_listings al on a.agent_id = al.agent_id
    left join agent_sales asales on a.agent_id = asales.agent_id
)

select * from final
