SELECT
    CAST(ReNummer AS INT) AS ReNummer,
    TRY_CAST(SummeNetto AS NUMERIC(10,2)) AS SummeNetto,
    CAST(MwStSatz AS INT) AS MwStSatz,
    TRY_CAST(ZahlungsbetragBrutto AS NUMERIC(10,2)) AS ZahlungsbetragBrutto,
    CAST(KdNr AS DECIMAL(5,0)) AS KdNr,
    TRY_CAST(Summenebenkosten AS NUMERIC(10,2)) AS Summenebenkosten,
    TRY_CAST(ReDatum AS DATE) AS ReDatum,
    TRY_CAST(Zahlungsdatum AS DATE) AS Zahlungsdatum
FROM {{ source('raw', 'excel_invoices') }}