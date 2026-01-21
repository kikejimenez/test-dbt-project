{{
    config(
        materialized='table'
    )
}}

with customers as (
    select * from {{ ref('stg_customers') }}
),

-- Customer purchase history
buyer_history as (
    select
        buyer_id as customer_id,
        count(*) as purchase_count,
        sum(sale_price) as total_purchase_value,
        avg(sale_price) as avg_purchase_price,
        min(closing_date) as first_purchase_date,
        max(closing_date) as last_purchase_date
    from {{ ref('stg_transactions') }}
    group by buyer_id
),

-- Customer sale history
seller_history as (
    select
        seller_id as customer_id,
        count(*) as sale_count,
        sum(sale_price) as total_sale_value,
        avg(sale_price) as avg_sale_price,
        min(closing_date) as first_sale_date,
        max(closing_date) as last_sale_date
    from {{ ref('stg_transactions') }}
    group by seller_id
),

final as (
    select
        c.customer_id,
        c.customer_first_name,
        c.customer_last_name,
        c.customer_full_name,
        c.customer_email,
        c.customer_phone,
        c.customer_address,
        c.customer_city,
        c.customer_state,
        c.customer_zip_code,
        c.customer_type,
        c.preapproval_amount,

        -- Buyer metrics
        coalesce(bh.purchase_count, 0) as total_purchases,
        coalesce(bh.total_purchase_value, 0) as total_purchase_value,
        round(coalesce(bh.avg_purchase_price, 0), 2) as avg_purchase_price,
        bh.first_purchase_date,
        bh.last_purchase_date,

        -- Seller metrics
        coalesce(sh.sale_count, 0) as total_sales,
        coalesce(sh.total_sale_value, 0) as total_sale_value,
        round(coalesce(sh.avg_sale_price, 0), 2) as avg_sale_price,
        sh.first_sale_date,
        sh.last_sale_date,

        -- Combined metrics
        coalesce(bh.purchase_count, 0) + coalesce(sh.sale_count, 0) as total_transactions,

        -- Customer segment
        case
            when bh.purchase_count > 0 and sh.sale_count > 0 then 'buyer_and_seller'
            when bh.purchase_count > 0 then 'buyer_only'
            when sh.sale_count > 0 then 'seller_only'
            else 'prospect'
        end as customer_segment,

        -- Metadata
        c.created_at,
        c.updated_at

    from customers c
    left join buyer_history bh on c.customer_id = bh.customer_id
    left join seller_history sh on c.customer_id = sh.customer_id
)

select * from final
