{{ config(materialized='table') }}

SELECT *,
    CASE
        WHEN Zahlungsdatum IS NULL AND CURRENT_DATE > ReDatum THEN 'Delayed'
        WHEN Zahlungsdatum IS NULL THEN 'Pending'
        ELSE 'Paid'
    END AS payment_status
FROM {{ ref('stg_invoices') }}
