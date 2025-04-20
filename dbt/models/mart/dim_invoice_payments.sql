SELECT
    ReNummer,
    ZahlungsbetragBrutto,
    Zahlungsdatum,
    ReDatum,
    CASE
        WHEN Zahlungsdatum IS NULL THEN 'Pending'
        WHEN DATEDIFF(day, ReDatum, Zahlungsdatum) > 30 THEN 'Delayed'
        ELSE 'Paid'
    END AS payment_status
FROM {{ ref('stg_invoices') }}