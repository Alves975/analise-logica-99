-- Taxa de conclusão das entregas
SELECT
    COUNT(*) AS total,
    SUM(status_entrega = 'concluida') AS concluidas,
    (SUM(status_entrega = 'concluida') / COUNT(*)) * 100 AS taxa_conclusao
FROM corridas;

-- Tempo medio das entregas
SELECT
    AVG(tempo_min) AS tempo_medio
FROM corridas;
