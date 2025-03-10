/* https://jackskylord.medium.com/dbt-jinja-macros-packages-overview-734c713ba3ff#:~:text=In%20dbt%2C%20Jinja%20is%20used,Statement%20Delimiter%3A%20%7B%25%20...
*/
{{
    config(materialized='view')
}}


with users as (
  select * from {{ ref('stg_users') }}
)
/* New customers */

SELECT
  *
FROM
  users
WHERE
  created_at >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 1 DAY)

