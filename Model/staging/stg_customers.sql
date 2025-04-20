SELECT
    CAST(id AS INT) AS id,
    CAST(KdNr AS DECIMAL(5,0)) AS KdNr,
    TRIM(Verlagsname) AS Verlagsname,
    TRIM(Region) AS Region
FROM {{ source('raw', 'word_customers') }}