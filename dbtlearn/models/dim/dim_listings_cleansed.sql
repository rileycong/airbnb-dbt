WITH src_listings AS (
    SELECT * FROM {{ ref("src_listings") }}
)

SELECT 
    listing_id,
    listing_name,
    room_type,
    CASE    -- Ensure minimum_nights is at least 1
        WHEN minimum_nights < 1 THEN 1
        ELSE minimum_nights
    END AS minimum_nights,
    host_id,
    REPLACE(price_str, '$', '') :: NUMBER(10,2) as price,   -- Remove dollar sign and convert to number
    created_at,
    updated_at
FROM
    src_listings