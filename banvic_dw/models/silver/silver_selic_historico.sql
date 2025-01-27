SELECT 
  CAST(Ano || '-' || mes_num || '-' ||'01' AS DATE) AS data
  , taxa AS taxa_selic
  , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM {{ref('bronze_selic_historico')}}