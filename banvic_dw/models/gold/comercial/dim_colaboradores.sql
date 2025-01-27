SELECT 
  co.cod_colaborador
  , ca.cod_agencia
  , co.primeiro_nome
  , co.ultimo_nome
  , co.email
  , co.cpf
  , co.cep
  , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM {{ref('silver_colaboradores')}} co
LEFT JOIN {{ref('silver_colaborador_agencia')}} ca
  ON co.cod_colaborador = ca.cod_colaborador