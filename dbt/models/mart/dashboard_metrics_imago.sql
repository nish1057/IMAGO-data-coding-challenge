SELECT
    c.Region,
    COUNT(DISTINCT i.ReNummer) AS total_invoices,
    SUM(p.Nettobetrag) AS total_net_revenue,
    COUNT(DISTINCT CASE WHEN ip.payment_status = 'Delayed' THEN i.ReNummer END) AS delayed_invoices
FROM {{ ref('fact_positions_clean') }} p
JOIN {{ ref('dim_invoice_payments') }} ip ON p.ReNummer = ip.ReNummer
JOIN {{ ref('stg_customers') }} c ON p.KdNr = c.KdNr
JOIN {{ ref('stg_invoices') }} i ON p.ReNummer = i.ReNummer
GROUP BY c.Region