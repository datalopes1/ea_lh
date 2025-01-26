WITH source AS (
    SELECT 
        cod_colaborador
        , primeiro_nome
        , ultimo_nome
        , email
        , cpf
        , data_nascimento
        , endereco
        , SPLIT(endereco, '/ ')[SAFE_OFFSET(1)] AS uf
        , cep
    FROM {{ref('bronze_colaboradores')}}
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
    , primeiro_nome
    , ultimo_nome
    , email
    , cpf
    , data_nascimento
    , endereco
    , uf
    , cep
    , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM clean
WHERE rn = 1