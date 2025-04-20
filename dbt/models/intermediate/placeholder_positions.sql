SELECT *
FROM {{ ref('stg_positions') }}
WHERE Bildnummer = 100000000