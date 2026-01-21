with source as (
    select * from {{ source('raw', 'property_features') }}
),

renamed as (
    select
        property_feature_id,
        property_id,
        feature_id,
        created_at
    from source
)

select * from renamed
