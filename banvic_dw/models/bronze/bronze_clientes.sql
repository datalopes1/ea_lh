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
        , cep
    FROM {{source('bv', 'clientes')}}
)

SELECT
    *
    , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM source