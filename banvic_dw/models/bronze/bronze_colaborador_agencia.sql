WITH source AS (
    SELECT
        cod_colaborador
        , cod_agencia
    FROM {{source('bv', 'colaborador_agencia')}}
)

SELECT
    *
    , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM source