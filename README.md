# CASE SAAS B2B
Case desenvolvido para análise da jornada de trial de um plataforma de SAAS B2B para PME, que objetiva observar métricas relacionadas à aquisição de cliente, consistindo em uma análise de dados exploratória com essa base, de forma a identificar gargalos e oportunidades para otimizar a entrada de negócios na plataforma. 


## Notebooks

- logistic_regression_modules_interactions: Esse notebook dá treina um modelo de regressão logística.
- models_prediction: Esse notebook aplica o modelo de regressão e escreve os resultados no BQ na tabela company.prediction_converted
- graphs: Esse notebook gera os gráficos utilizados na apresentação.

## Queries
- conversion_rate: Calcula a taxa  conversão agrupado por  mês e is_chain.
- create_master_table: Cria a master table consultada para gerar o dashboard.
- create_tables: Cria os esquemas da tabela do BigQuery.
- creditation_time: Calcula o tempo de acreditação 
- dau_by_date: Daily Active Users agrupado por data.
- dau_conversion: Daily Active Users agrupado por clinic_id is_chain_clinic e is_converted.
- interactions_conversions_to_predict: Calcula a média de interações diárias por clínica. Sem filtros.
- interactions_conversions_all:  Calcula a média de interações diárias por clínica. Com filtro trial duration > 0.
- interactions_conversions: Calcula a média de interações diárias por clínica. Com filtro trial duration = 7 e IS_CHAIN_CLINIC is False
- mau: Calcula usuários ativos mensais. Agupado por mes.
- module_usage_pivot: Calcula a utilização por módulo, agrupado por is_converted [Não utilizado] 
- module_usage_days: Calcula a utilização do módulo, agrupado por quantidade de dias utilizados. [Não utilizado] 
- mrr: Calcula a renda mensal média.
- setup_time: Calcula o tempo médio de setup das clínicas.
- ticket: Calcula o ticket médio.
