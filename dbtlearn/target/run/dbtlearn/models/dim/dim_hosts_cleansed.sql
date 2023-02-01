
  
    

        create or replace transient table airbnb.dev.dim_hosts_cleansed  as
        (With  __dbt__cte__src_hosts as (
WITH raw_hosts AS(
        SELECT * FROM AIRBNB.RAW.RAW_HOSTS)
SELECT 
    id AS host_id,
    name AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    raw_hosts
),src_hosts as (
    select * from __dbt__cte__src_hosts
)
SELECT
    host_id,
    NVL(host_name,'Anonymous') as host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    src_hosts
        );
      
  