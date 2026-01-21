with source as (
    select * from {{ source('raw', 'listing_statuses') }}
),

renamed as (
    select
        status_id,
        name as status_name,
        description as status_description,
        created_at
    from source
)

select * from renamed
