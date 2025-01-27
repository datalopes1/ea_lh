SELECT
  tr.cod_transacao
  , tr.num_conta
  , co.cod_agencia
  , tr.data_transacao
  , tr.nome_transacao
  , tr.valor_transacao
  , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM {{ref('silver_transacoes')}} tr
INNER JOIN {{ref('silver_contas')}} co
  ON tr.num_conta = co.num_conta