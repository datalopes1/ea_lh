SELECT 
    pc.cod_proposta
    , pc.cod_cliente AS num_conta
    , pc.cod_colaborador
    , co.cod_agencia
    , pc.data_entrada_proposta
    , pc.taxa_juros_mensal
    , pc.valor_proposta
    , pc.valor_financiamento
    , pc.valor_entrada
    , pc.valor_prestacao
    , pc.quantidade_parcelas
    , pc.carencia
    , pc.status_proposta
    , pc.receita_prevista_juros
    , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM {{ref('silver_propostas_credito')}} pc
INNER JOIN {{ref('silver_colaborador_agencia')}} co
    ON pc.cod_colaborador = co.cod_colaborador