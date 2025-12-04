CREATE OR REPLACE VIEW view_custo_operacionais AS 
SELECT 
    c.nome AS cidade,
    AVG(cp.custo_medio_km) AS custo_medio_por_km,
    cp.custo_total_mes
FROM custos_operacionais AS cp
INNER JOIN cidades AS c 
    ON cp.id_cidade = c.id_cidade
GROUP BY c.nome, cp.custo_total_mes;