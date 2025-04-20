SELECT *,
    CASE WHEN ReId IS NULL THEN 'Missing ReId' END AS ReId_flag,
    CASE 
        WHEN KdNr IS NULL THEN 'Missing KdNr'
        WHEN KdNr NOT IN (SELECT KdNr FROM {{ ref('stg_customers') }}) THEN 'Invalid KdNr'
    END AS KdNr_flag
FROM {{ ref('stg_positions') }}