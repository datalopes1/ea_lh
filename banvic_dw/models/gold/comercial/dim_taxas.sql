SELECT 
  ip.data
  , ip.taxa_ipca
  , se.taxa_selic
  , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM {{ref('silver_ipca_historico')}} ip
LEFT JOIN {{ref('silver_selic_historico')}} se
  ON ip.data = se.data
WHERE ip.data >= '2010-01-01'


