SELECT 
  co.num_conta
  , co.cod_colaborador
  , co.tipo_conta
  , co.data_abertura
  , co.data_ultimo_lancamento
  , cl.data_nascimento
  , cl.cpfcnpj
  , cl.cep
  , co.saldo_total
  , co.saldo_disponivel
  , co.tempo_relacionamento
  , co.cliente_ativo
  , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM {{ref('silver_clientes')}} cl
INNER JOIN {{ref('silver_contas')}} co
  ON cl.cod_cliente = co.cod_cliente 