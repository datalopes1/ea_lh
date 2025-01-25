WITH source AS (
    SELECT 
        num_conta
        , cod_cliente
        , cod_agencia
        , cod_colaborador
        , tipo_conta
        , data_abertura
        , saldo_total
        , saldo_disponivel
        , data_ultimo_lancamento
    FROM {{source('bv', 'contas')}}
)

SELECT 
    *
    , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM source