SELECT
    CAST(id AS INT) AS id,
    CAST(ReId AS INT) AS ReId,
    CAST(KdNr AS DECIMAL(5,0)) AS KdNr,
    CAST(Nettobetrag AS NUMERIC(10,2)) AS Nettobetrag,
    NULLIF(Bildnummer, 0) AS Bildnummer,
    TRY_CAST(VerDatum AS DATE) AS VerDatum
FROM {{ source('raw', 'access_positions') }}