WITH source AS (
    SELECT
        cod_colaborador
        , primeiro_nome
        , ultimo_nome
        , email
        , cpf
        , data_nascimento
        , endereco
        , cep
    FROM {{source('bv', 'colaboradores')}}
)

SELECT
    *
    , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM source