with source as (
    select * from {{ source('raw', 'agents') }}
),

renamed as (
    select
        agent_id,
        office_id,
        first_name as agent_first_name,
        last_name as agent_last_name,
        first_name || ' ' || last_name as agent_full_name,
        email as agent_email,
        phone as agent_phone,
        license_number,
        license_expiry,
        hire_date,
        commission_rate,
        is_active as is_agent_active,
        created_at,
        updated_at
    from source
)

select * from renamed
