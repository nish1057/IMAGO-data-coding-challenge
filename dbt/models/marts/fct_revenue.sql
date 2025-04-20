{{ config(materialized='table') }}

SELECT
    p.id AS position_id,
    p.ReId,
    i.ZahlungsbetragBrutto,
    p.Nettobetrag,
    c.Kdnr,
    c.Verlagsname,
    c.Region,
    i.ReDatum,
    i.Zahlungsdatum,
    ps.payment_status
FROM {{ ref('int_valid_positions') }} p
JOIN {{ ref('stg_invoices') }} i ON p.ReId = i.ReNummer
JOIN {{ ref('int_valid_customers') }} c ON p.KdNr = c.Kdnr
JOIN {{ ref('int_payment_status') }} ps ON i.ReNummer = ps.ReNummer
