{{ config(materialized='view') }}

SELECT
    id,
    Kdnr,
    Verlagsname,
    Region,
    CASE
        WHEN Verlagsname ~ '[^a-zA-Z0-9äöüÄÖÜß\s]' THEN TRUE
        ELSE FALSE
    END AS has_special_chars_verlagsname,
    CASE
        WHEN Region ~ '[^a-zA-Z0-9äöüÄÖÜß\s]' THEN TRUE
        ELSE FALSE
    END AS has_special_chars_region
FROM {{ source('raw', 'Abrechnung_Kunden') }}
