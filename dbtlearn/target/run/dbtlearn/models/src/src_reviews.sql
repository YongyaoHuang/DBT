
  create or replace   view airbnb.dev.src_reviews
  
   as (
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
  );

