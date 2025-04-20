SELECT *
FROM {{ ref('fact_positions_enriched') }}
WHERE ReNummer IS NOT NULL
  AND KdNr IS NOT NULL
  AND Bildnummer IS DISTINCT FROM 100000000