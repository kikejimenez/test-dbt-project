with source as (
    select * from {{ source('raw', 'offices') }}
),

renamed as (
    select
        office_id,
        name as office_name,
        address as office_address,
        city as office_city,
        state as office_state,
        zip_code as office_zip_code,
        phone as office_phone,
        email as office_email,
        founded_date,
        is_active as is_office_active,
        created_at,
        updated_at
    from source
)

select * from renamed
