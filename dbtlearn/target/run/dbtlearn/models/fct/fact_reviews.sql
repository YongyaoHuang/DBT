-- back compat for old kwarg name
  
  begin;
    

        insert into airbnb.dev.fact_reviews ("LISTING_ID", "REVIEW_DATE", "REVIEWER_NAME", "REVIEW_TEXT", "REVIEW_SENTIMENT")
        (
            select "LISTING_ID", "REVIEW_DATE", "REVIEWER_NAME", "REVIEW_TEXT", "REVIEW_SENTIMENT"
            from airbnb.dev.fact_reviews__dbt_tmp
        );
    commit;