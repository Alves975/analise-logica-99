USE logistica_99;

CREATE OR REPLACE VIEW view_dashboard_geral AS
WITH valores_convertidos AS (
    SELECT
        c.id_corrida,
        c.id_cidade,
        c.id_entregador,

        
        CAST(REPLACE(c.distancia_km, ',', '.') AS DECIMAL(10,2)) AS distancia_km,
        c.tempo_min,
        c.status_entrega,
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

    -- 🔹 Incentivo: 10% do valor da corrida
    (c.valor_corrida * 0.10) AS incentivo_corrida,

    -- 🔹 Custo: 40% do valor da corrida
    (c.valor_corrida * 0.40) AS custo_corrida,

    -- 🔹 Receita (lucro bruto)
    (c.valor_corrida - (c.valor_corrida * 0.40) - (c.valor_corrida * 0.10)) AS receita,

    -- 🔹 Margem %
    CASE 
        WHEN c.valor_corrida > 0 THEN
            (
                (c.valor_corrida - (c.valor_corrida * 0.40) - (c.valor_corrida * 0.10))
                / c.valor_corrida
            ) * 100
        ELSE NULL
    END AS margem_percentual,

    -- Tempo por km
    CASE 
        WHEN c.distancia_km > 0 THEN c.tempo_min / c.distancia_km
        ELSE NULL
    END AS tempo_por_km,

    -- Valor por km
    CASE 
        WHEN c.distancia_km > 0 THEN c.valor_corrida / c.distancia_km
        ELSE NULL
    END AS valor_por_km

FROM valores_convertidos c
JOIN cidades ci ON c.id_cidade = ci.id_cidade
JOIN entregadores e ON c.id_entregador = e.id_entregador;
