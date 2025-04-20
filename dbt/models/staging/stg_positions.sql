{{ config(materialized='view') }}

SELECT
    id,
    ReId,
    KdNr,
    Nettobetrag,
    Bildnummer,
    CAST(VerDatum AS DATE) AS VerDatum,
    CASE
        WHEN Bildnummer IN (100000000) THEN TRUE
        ELSE FALSE
    END AS is_placeholder_media
FROM {{ source('raw', 'Abrechnung_Positionen') }}
