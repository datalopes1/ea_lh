WITH source AS (
  SELECT 
    Ano AS ano
    , mes_nome
    , mes_num
    , taxa
  FROM {{ref('bronze_selic_historico')}}
)

SELECT
  ano
  , mes_nome
  , mes_num
  , taxa
  , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM source