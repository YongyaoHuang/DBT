

with  __dbt__cte__src_reviews as (
WITH raw_reviews AS(
        SELECT * FROM AIRBNB.RAW.RAW_REVIEWS)
SELECT 
    listing_id,
    DATE as review_date,
    reviewer_name,
    comments as review_text,
    sentiment as review_sentiment
FROM
    raw_reviews
),src_reviews as (
    select * from __dbt__cte__src_reviews
)
select * from src_reviews
where review_text is not null


    And review_date>(select max(review_date) from airbnb.dev.fact_reviews)
