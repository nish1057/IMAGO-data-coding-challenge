SELECT *
FROM {{ ref('stg_invoices') }} i
LEFT JOIN {{ ref('stg_positions') }} p ON i.ReNummer = p.ReId
WHERE p.ReId IS NULL
