WITH source AS (
    SELECT 
        cod_proposta
        , cod_cliente
        , cod_colaborador
        , data_entrada_proposta
        , taxa_juros_mensal
        , valor_proposta
        , valor_financiamento
        , valor_entrada
        , valor_prestacao
        , quantidade_parcelas
        , carencia
        , status_proposta
    FROM {{source('bv', 'propostas_credito')}}
)

SELECT 
    *
    , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM source