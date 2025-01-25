WITH source AS (
    SELECT 
        cod_agencia
        , nome
        , endereco
        , cidade
        , uf
        , data_abertura
        , tipo_agencia
    FROM {{source('bv', 'agencias')}}
)

SELECT
    *
    , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM source