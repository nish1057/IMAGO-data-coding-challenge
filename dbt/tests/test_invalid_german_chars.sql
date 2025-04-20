SELECT *
FROM {{ ref('stg_customers') }}
WHERE has_special_chars_verlagsname = TRUE
   OR has_special_chars_region = TRUE
