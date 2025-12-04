SELECT
    ci.nome AS cidade,
    COUNT(*) AS total_corridas,
    AVG(c.tempo_min) AS tempo_medio,
    SUM(c.status_entrega = 'atrasada') AS atrasos,
    (SUM(c.status_entrega = 'atrasada') / COUNT(*)) * 100 AS taxa_atraso
FROM corridas c
JOIN cidades ci ON c.id_cidade = ci.id_cidade
GROUP BY ci.nome;
