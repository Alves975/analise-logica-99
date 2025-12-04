# 📦 Sistema de Gestão Logística – Dashboard Operacional

Este projeto simula uma operação logística (estilo 99/Loggi/Uber Eats) com foco em gestão de entregas, análise financeira, métricas operacionais e otimização de performance.

---

## 🚀 Objetivo do Projeto

Criar um sistema completo que permita:

- Registrar entregas (corridas)
- Calcular custos, incentivos e margem
- Acompanhar o desempenho por cidade e entregador
- Gerar indicadores para tomada de decisão
- Simular o funcionamento financeiro de uma operação logística real

---

## 🧱 Estrutura do Banco de Dados

Tabelas principais:

- cidades
- entregadores
- corridas
- custos_operacionais (opcional)

---

## 📊 Lógica Financeira

| Métrica | Cálculo |
|--------|---------|
| Custo da corrida | 40% do valor_corrida |
| Incentivo do entregador | 10% do valor_corrida |
| Receita (lucro da empresa) | valor_corrida − custo − incentivo |
| Margem (%) | (receita / valor_corrida) × 100 |

---

## 🧮 VIEW Principal

```sql
-- ###############################################################
-- ### VIEW: view_dashboard_geral                               ###
-- ### Descrição:                                               ###
-- ### - Converte valores numéricos vindos com vírgula          ###
-- ### - Aplica regras fixas:                                   ###
-- ###     • Custo = 40% do valor da corrida                    ###
-- ###     • Incentivo = 10% do valor da corrida                ###
-- ### - Calcula receita e margem                               ###
-- ### - Gera métricas de desempenho por corrida                ###
-- ###############################################################

USE logistica_99;

CREATE OR REPLACE VIEW view_dashboard_geral AS
WITH valores_convertidos AS (
    SELECT
        c.id_corrida,
        c.id_cidade,
        c.id_entregador,

        -- Conversão do KM com vírgula → decimal (2 casas)
        CAST(REPLACE(c.distancia_km, ',', '.') AS DECIMAL(10,2)) AS distancia_km,

        c.tempo_min,
        c.status_entrega,

        -- Conversão do valor da corrida para decimal
        CAST(REPLACE(c.valor_corrida, ',', '.') AS DECIMAL(10,2)) AS valor_corrida
    FROM corridas c
)

SELECT
    c.id_corrida,
    ci.nome AS cidade,
    e.nome AS entregador,
    c.distancia_km,
    c.tempo_min,
    c.valor_corrida,
    c.status_entrega,

    -- 10% do valor da corrida = incentivo
    (c.valor_corrida * 0.10) AS incentivo_corrida,

    -- 40% do valor da corrida = custo
    (c.valor_corrida * 0.40) AS custo_corrida,

    -- Receita = valor - custo - incentivo
    (
        c.valor_corrida 
        - (c.valor_corrida * 0.40) 
        - (c.valor_corrida * 0.10)
    ) AS receita,

    -- Margem % sobre o valor total da corrida
    CASE 
        WHEN c.valor_corrida > 0 THEN
            (
                (c.valor_corrida - (c.valor_corrida * 0.40) - (c.valor_corrida * 0.10))
                / c.valor_corrida
            ) * 100
        ELSE NULL
    END AS margem_percentual,

    -- Tempo médio por km
    CASE 
        WHEN c.distancia_km > 0 THEN c.tempo_min / c.distancia_km
        ELSE NULL 
    END AS tempo_por_km,

    -- Valor médio por km
    CASE 
        WHEN c.distancia_km > 0 THEN c.valor_corrida / c.distancia_km
        ELSE NULL 
    END AS valor_por_km

FROM valores_convertidos c
JOIN cidades ci ON c.id_cidade = ci.id_cidade
JOIN entregadores e ON c.id_entregador = e.id_entregador;


## 📈 Sugestões de Dashboards

Desempenho por cidade

Desempenho por entregador

Volume de corridas

Margem total

Mapa de calor

Top entregadores

## 🧰 Tecnologias

MySQL

SQL

Power BI (opcional)

Python (opcional)

## 🏁 Conclusão

Projeto demonstra:

SQL avançado

Modelagem

Cálculos financeiros

Métricas logísticas

Base para dashboards