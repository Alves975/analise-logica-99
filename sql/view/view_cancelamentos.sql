CREATE OR REPLACE VIEW view_cancelamento AS
SELECT 
    c.id_entregador AS entregador,
    ci.nome AS cidade,
    COUNT(*) AS total_cancelamentos 
FROM corridas AS c
INNER JOIN cidades ci 
    ON c.id_cidade = ci.id_cidade 
WHERE LOWER(c.status_entrega) = 'cancelada'
GROUP BY c.id_entregador, ci.nome;