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
    , (valor_proposta * POWER(1 + taxa_juros_mensal, quantidade_parcelas)) - valor_proposta AS receita_prevista_juros
  FROM {{ref('bronze_propostas_credito')}}
  WHERE cod_proposta IS NOT NULL
),

clean AS (
SELECT
  *
  , ROW_NUMBER() OVER(PARTITION BY cod_proposta) AS rn
FROM source
)

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
  , receita_prevista_juros
  , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM clean
WHERE rn = 1