{{
    config(materialized='view')
}}

/* New events in the last 24 hours */

SELECT
  *
FROM
  `bigquery-public-data.thelook_ecommerce.events`
WHERE
  created_at >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 1 DAY)

