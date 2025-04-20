{{ config(materialized='table') }}

WITH base AS (
    SELECT
        id,
        Kdnr,
        TRIM(Verlagsname) AS Verlagsname,
        TRIM(Region) AS Region
    FROM {{ ref('stg_customers') }}
    WHERE Verlagsname IS NOT NULL
      AND Region IS NOT NULL
      AND has_special_chars_verlagsname = FALSE
      AND has_special_chars_region = FALSE
),

deduplicated AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Kdnr ORDER BY id DESC) AS row_num
    FROM base
)

SELECT
    id,
    Kdnr,
    Verlagsname,
    Region
FROM deduplicated
WHERE row_num = 1