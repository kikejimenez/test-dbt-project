with source as (
    select * from {{ source('raw', 'neighborhoods') }}
),

renamed as (
    select
        neighborhood_id,
        name as neighborhood_name,
        city,
        state,
        zip_code,
        median_income,
        walkability_score,
        created_at
    from source
)

select * from renamed
