WITH source AS (
    SELECT
        ano || '-' || mes_num || '-' || dia AS data
        , ano
        , mes_num
        , dia
        , trimestre
        , dia_num
        , mes_nome
        , dia_nome
        , fim_de_semana
    FROM {{ref('bronze_data')}}
)

SELECT
   CAST(data AS DATE) AS data
  , ano
  , mes_num
  , dia AS dia_num
  , trimestre
  , mes_nome
  , dia_nome
  , fim_de_semana
  , CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM source
ORDER BY data