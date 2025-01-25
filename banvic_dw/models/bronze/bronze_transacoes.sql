WITH source AS (
    SELECT 
        cod_transacao
        , num_conta
        , data_transacao
        , nome_transacao
        , valor_transacao
    FROM {{source('bv', 'transacoes')}}
)

SELECT 
    *
    , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM source