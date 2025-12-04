CREATE OR REPLACE VIEW view_entregas_concluidas AS
SELECT  
    c.id_entregador,
    c.valor_corrida,
    c.status_entrega
FROM corridas AS c
WHERE LOWER(c.status_entrega) = 'concluida';