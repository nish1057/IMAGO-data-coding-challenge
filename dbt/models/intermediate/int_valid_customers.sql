{{ config(materialized='table') }}

SELECT *
FROM {{ ref('stg_customers') }}
WHERE has_special_chars_verlagsname = FALSE
  AND has_special_chars_region = FALSE
