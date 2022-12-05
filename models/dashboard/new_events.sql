{{
    config(materialized='view')
}}


with events as (
  select * from {{ ref('stg_events') }}
)
/* New events in the last 24 hours */

SELECT
  *
FROM
  events
WHERE
  created_at >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 1 DAY)

