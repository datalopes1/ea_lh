WITH source AS (
    SELECT
        cod_colaborador
        , cod_agencia
    FROM {{ref('bronze_colaborador_agencia')}}
    WHERE cod_colaborador IS NOT NULL
),

clean AS (
    SELECT
        *
        , ROW_NUMBER() OVER(PARTITION BY cod_colaborador) AS rn
    FROM source
)

SELECT
    cod_colaborador
    , cod_agencia
    , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM clean
WHERE rn = 1