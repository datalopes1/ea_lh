SELECT
  cod_transacao
  , num_conta
  , data_transacao
  , nome_transacao
  , valor_transacao
  , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM {{ref('silver_transacoes')}}