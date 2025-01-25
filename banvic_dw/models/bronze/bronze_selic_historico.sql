WITH source AS (
    SELECT
        Ano
        , mes_nome
        , mes_num
        , taxa
    FROM {{source('bv', 'selic_historico')}}
)

SELECT 
    *
    , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM source