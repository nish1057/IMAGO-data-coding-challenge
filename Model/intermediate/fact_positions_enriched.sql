SELECT
    p.id AS position_id,
    p.Nettobetrag,
    p.Bildnummer,
    p.VerDatum,
    i.ReNummer,
    i.ReDatum,
    c.KdNr,
    c.Verlagsname,
    c.Region
FROM {{ ref('stg_positions') }} p
LEFT JOIN {{ ref('stg_invoices') }} i ON p.ReId = i.ReNummer
LEFT JOIN {{ ref('stg_customers') }} c ON p.KdNr = c.KdNr