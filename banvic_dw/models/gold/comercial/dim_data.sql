SELECT
  data
  , CAST(data AS DATETIME) AS data_truncada
  , ano
  , mes_num
  , dia_num
  , trimestre
  , mes_nome
  , dia_nome
  , fim_de_semana
  , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM {{ref('silver_data')}}