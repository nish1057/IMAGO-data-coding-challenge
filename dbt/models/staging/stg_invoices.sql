{{ config(materialized='view') }}

SELECT
    ReNummer,
    SummeNetto,
    MwStSatz,
    ZahlungsbetragBrutto,
    KdNr,
    Summenebenkosten,
    CAST(ReDatum AS DATE) AS ReDatum,
    CAST(Zahlungsdatum AS DATE) AS Zahlungsdatum
FROM {{ source('raw', 'Abrechnung_Rechnungen') }}
