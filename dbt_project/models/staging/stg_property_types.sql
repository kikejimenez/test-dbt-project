with source as (
    select * from {{ source('raw', 'property_types') }}
),

renamed as (
    select
        property_type_id,
        name as property_type_name,
        description as property_type_description,
        created_at
    from source
)

select * from renamed
