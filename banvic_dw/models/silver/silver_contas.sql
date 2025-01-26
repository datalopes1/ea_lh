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
    , DATE_DIFF(DATE '2023-01-31', SAFE_CAST(data_abertura AS DATE), YEAR) AS tempo_relacionamento
    , CASE
        WHEN DATE_DIFF(DATE '2023-01-31', CAST(data_ultimo_lancamento AS DATE), DAY) > 180 THEN 'Não'
        ELSE 'Sim'
      END AS cliente_ativo
  FROM {{ref('bronze_contas')}}
  WHERE num_conta IS NOT NULL
),

clean AS(
  SELECT 
    *
    , ROW_NUMBER() OVER(PARTITION BY num_conta) AS rn
  FROM source
)

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
  , tempo_relacionamento
  , cliente_ativo
  , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM clean
