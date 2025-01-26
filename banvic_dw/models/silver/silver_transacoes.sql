WITH source AS (
    SELECT 
        cod_transacao
        , num_conta
        , data_transacao
        , nome_transacao
        , valor_transacao
    FROM {{ref('bronze_transacoes')}}
    WHERE cod_transacao IS NOT NULL 
),

clean AS (
SELECT 
  *
  , ROW_NUMBER() OVER(PARTITION BY cod_transacao) AS rn 
FROM source
)

SELECT
  cod_transacao
  , num_conta
  , data_transacao
  , nome_transacao
  , valor_transacao
  , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM clean
WHERE rn = 1