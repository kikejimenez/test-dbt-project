with source as (
    select * from {{ source('raw', 'price_history') }}
),

renamed as (
    select
        price_history_id,
        property_id,
        price,
        change_date,
        change_type,
        change_reason,
        created_at
    from source
)

select * from renamed
