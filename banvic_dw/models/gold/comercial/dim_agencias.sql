SELECT
  cod_agencia
  , nome
  , cidade
  , uf
  , data_abertura
  , tipo_agencia
  , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM {{ref('silver_agencias')}}