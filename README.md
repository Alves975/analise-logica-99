# 📦 Sistema de Gestão Logística — Dashboard Operacional

Projeto de exemplo para simular uma operação de entregas (estilo 99/Loggi/Uber Eats) com foco em métricas operacionais e financeiras.

## Objetivos
- Registrar corridas/entregas
- Calcular custos, incentivos e margem
- Acompanhar desempenho por cidade e entregador
- Gerar indicadores para tomada de decisão

## Modelo de dados (resumo)
Tabelas principais:
- cidades
- entregadores
- corridas
- custos_operacionais (opcional)

## Lógica financeira (resumo)
- Custo da corrida = 40% do valor_corrida  
- Incentivo do entregador = 10% do valor_corrida  
- Receita (empresa) = valor_corrida − custo − incentivo  
- Margem (%) = (receita / valor_corrida) × 100

## VIEW: view_dashboard_geral (exemplo)
Descrição: converte strings numéricas com vírgula para decimal, aplica regras fixas (custo 40%, incentivo 10%) e calcula receita, margem e métricas por corrida.

Observação: ajuste o esquema/nome do banco (schema) e tipos conforme seu SGBD antes de criar a view. Se seus campos já estão em tipo numérico, remova as conversões.

```sql
-- filepath: c:\Users\alves\OneDrive\Documentos\Projetos\projeto-analise-logistica-99\sql\view_dashboard_geral.sql
-- Substitua "seu_schema" pelo schema/base correto (ex.: logistica_99)
CREATE OR REPLACE VIEW seu_schema.view_dashboard_geral AS
WITH valores_convertidos AS (
    SELECT
        c.id_corrida,
        c.id_cidade,
        c.id_entregador,
        -- Converter texto com vírgula para decimal (ajuste conforme necessário)
        CAST(REPLACE(c.distancia_km, ',', '.') AS DECIMAL(10,2)) AS distancia_km,
        c.tempo_min,
        c.status_entrega,
        CAST(REPLACE(c.valor_corrida, ',', '.') AS DECIMAL(10,2)) AS valor_corrida
    FROM seu_schema.corridas c
)
SELECT
    c.id_corrida,
    ci.nome AS cidade,
    e.nome AS entregador,
    c.distancia_km,
    c.tempo_min,
    c.valor_corrida,
    c.status_entrega,
    (c.valor_corrida * 0.10) AS incentivo_corrida,
    (c.valor_corrida * 0.40) AS custo_corrida,
    (c.valor_corrida - (c.valor_corrida * 0.40) - (c.valor_corrida * 0.10)) AS receita,
    CASE WHEN c.valor_corrida > 0 THEN
        ((c.valor_corrida - (c.valor_corrida * 0.40) - (c.valor_corrida * 0.10)) / c.valor_corrida) * 100
    ELSE NULL END AS margem_percentual,
    CASE WHEN c.distancia_km > 0 THEN c.tempo_min / c.distancia_km ELSE NULL END AS tempo_por_km,
    CASE WHEN c.distancia_km > 0 THEN c.valor_corrida / c.distancia_km ELSE NULL END AS valor_por_km
FROM valores_convertidos c
JOIN seu_schema.cidades ci ON c.id_cidade = ci.id_cidade
JOIN seu_schema.entregadores e ON c.id_entregador = e.id_entregador;
```

## Sugestões de dashboards
- Desempenho por cidade  
- Desempenho por entregador  
- Volume de corridas ao longo do tempo  
- Margem total e por segmento  
- Mapa de calor por região  
- Top entregadores (por receita e por corridas)

## Tecnologias
- MySQL / MariaDB (exemplo)
- SQL
- Power BI / Metabase / Tableau (visualização)
- Python (ETL / análises adicionais)

## Como usar
1. Ajuste nomes de schema/tabela/campos no SQL acima conforme sua base.  
2. Execute o SQL no seu SGBD para criar a view.  
3. Construa relatórios na ferramenta de visualização ou extraia via Python/SQL.

## Observações finais
Este repositório é uma base para estudo — adapte regras, percentuais e fontes de dados conforme o contexto real.