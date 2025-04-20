{{ config(materialized='table') }}

SELECT *
FROM {{ ref('stg_positions') }}
WHERE ReId IS NOT NULL
  AND KdNr IN (SELECT KdNr FROM {{ ref('stg_customers') }})
  AND is_placeholder_media = FALSE
