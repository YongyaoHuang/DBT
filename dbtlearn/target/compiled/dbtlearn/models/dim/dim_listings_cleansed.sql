With  __dbt__cte__src_listings as (
WITH raw_listings AS(
        SELECT * FROM AIRBNB.RAW.RAW_LISTINGS)
SELECT 
    id AS listing_id,
    name AS listing_name,
    listing_url,
    room_type,
    minimum_nights,
    host_id,
    price as price_str,
    created_at,
    updated_at
FROM
    raw_listings
),src_listings as (
    select * from __dbt__cte__src_listings
)
SELECT
    listing_id,
    listing_name,
    room_type,
    case
        when minimum_nights=0 then 1
        else minimum_nights
    end as minimum_nights,
    host_id,
    replace(
        price_str,
        '$'
    )::NUMBER(
        10,
        2
    ) as price,
    created_at,
    updated_at
FROM
    src_listings