with source as (
    select * from {{ source('raw', 'customers') }}
),

renamed as (
    select
        customer_id,
        first_name as customer_first_name,
        last_name as customer_last_name,
        first_name || ' ' || last_name as customer_full_name,
        email as customer_email,
        phone as customer_phone,
        address as customer_address,
        city as customer_city,
        state as customer_state,
        zip_code as customer_zip_code,
        customer_type,
        preapproval_amount,
        created_at,
        updated_at
    from source
)

select * from renamed
