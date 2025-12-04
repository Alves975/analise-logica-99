SELECT
    e.nome,
    COUNT(*) AS total_corridas,
    SUM(c.status_entrega = 'concluida') AS concluidas,
    AVG(c.tempo_min) AS tempo_medio
FROM corridas c
JOIN entregadores e ON c.id_entregador = e.id_entregador
GROUP BY e.nome
ORDER BY concluidas DESC;
