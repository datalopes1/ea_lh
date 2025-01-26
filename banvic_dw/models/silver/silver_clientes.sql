WITH source AS (
    SELECT
          cod_cliente
        , primeiro_nome
        , ultimo_nome
        , email
        , tipo_cliente
        , data_inclusao
        , cpfcnpj
        , data_nascimento
        , endereco
        , SPLIT(endereco, '/ ')[SAFE_OFFSET(1)] AS uf
        , cep
    FROM {{ref('bronze_clientes')}}
    WHERE cod_cliente IS NOT NULL
),

clean AS (
    SELECT
        *
        , ROW_NUMBER() OVER(PARTITION BY cod_cliente) AS rn
    FROM source
)

SELECT
    cod_cliente
    , primeiro_nome
    , ultimo_nome
    , email
    , tipo_cliente
    , data_inclusao
    , cpfcnpj
    , data_nascimento
    , endereco
    , uf
    , cep
    , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM clean
WHERE rn = 1

