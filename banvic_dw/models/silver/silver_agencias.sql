WITH source AS (
    SELECT 
        cod_agencia
        , nome
        , endereco
        , cidade
        , uf
        , data_abertura
        , tipo_agencia
    FROM {{ref('bronze_agencias')}}
    WHERE cod_agencia IS NOT NULL
),

clean AS (
    SELECT
        *
        , ROW_NUMBER() OVER(PARTITION BY cod_agencia) AS rn
    FROM source
)

SELECT 
    cod_agencia
    , nome
    , endereco
    , cidade
    , uf
    , data_abertura
    , tipo_agencia
    , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM clean
WHERE rn = 1