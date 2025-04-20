SELECT *
FROM {{ ref('fact_positions_enriched') }}
WHERE ReNummer IS NULL OR KdNr IS NULL OR Bildnummer = 100000000