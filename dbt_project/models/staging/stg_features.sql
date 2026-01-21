with source as (
    select * from {{ source('raw', 'features') }}
),

renamed as (
    select
        feature_id,
        name as feature_name,
        category as feature_category,
        created_at
    from source
)

select * from renamed
