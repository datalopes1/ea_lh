WITH source AS (
    SELECT
        data
        , ano
        , mes_num
        , dia
        , trimestre
        , dia_num
        , mes_nome
        , dia_nome
        , fim_de_semana
    FROM {{source('bv', 'data')}}
)

SELECT 
    *
    , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM source