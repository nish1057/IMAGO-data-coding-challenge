SELECT *
FROM {{ ref('invalid_data_flags') }}
WHERE ReId_flag IS NOT NULL OR KdNr_flag IS NOT NULL