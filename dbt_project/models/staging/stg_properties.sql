with source as (
    select * from {{ source('raw', 'properties') }}
),

renamed as (
    select
        property_id,
        neighborhood_id,
        property_type_id,
        listing_agent_id,
        status_id,
        address as property_address,
        city as property_city,
        state as property_state,
        zip_code as property_zip_code,
        latitude,
        longitude,
        year_built,
        square_feet,
        lot_size_sqft,
        bedrooms,
        bathrooms,
        garage_spaces,
        stories,
        list_price,
        hoa_monthly,
        property_tax_annual,
        description as property_description,
        listing_date,
        days_on_market,
        created_at,
        updated_at
    from source
)

select * from renamed
