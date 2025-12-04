INSERT INTO cidades (id_cidade, nome, regiao, demanda_media_dia, nivel_prioridade)
VALUES
(1, 'São Paulo', 'Sudeste', 2500, 'Alta'),
(2, 'Cotia', 'Sudeste', 800, 'Média'),
(3, 'Barueri', 'Sudeste', 1500, 'Alta'),
(4, 'Osasco', 'Sudeste', 1200, 'Alta'),
(5, 'Campinas', 'Sudeste', 1700, 'Alta');

INSERT INTO entregadores (id_entregador, id_cidade, nome, tipo_veiculo, avaliacao, horas_trabalhadas_mes)
VALUES
(1, 1, 'Carlos Andrade', 'Moto', 4.7, 160),
(2, 1, 'Marcos Silva', 'Carro', 4.6, 150),
(3, 3, 'Julia Santos', 'Moto', 4.8, 170),
(4, 4, 'Fernanda Souza', 'Bike', 4.3, 120),
(5, 5, 'Ricardo Lima', 'Moto', 4.9, 180),
(6, 1, 'Pedro Magalhães', 'Carro', 4.5, 140),
(7, 2, 'Thiago Nunes', 'Moto', 4.4, 155),
(8, 3, 'Amanda Ribeiro', 'Carro', 4.6, 165),
(9, 5, 'Rafael Cunha', 'Moto', 4.7, 175),
(10, 4, 'Bruna Costa', 'Bike', 4.2, 110),
(11, 2, 'Lucas Pereira', 'Moto', 4.5, 160),
(12, 3, 'Natália Martins', 'Carro', 4.6, 150),
(13, 1, 'Henrique Souza', 'Moto', 4.8, 170),
(14, 4, 'Paula Araújo', 'Carro', 4.3, 130),
(15, 5, 'Diego Farias', 'Moto', 4.9, 185);

INSERT INTO corridas (id_cidade, id_entregador, distancia_km, tempo_min, valor_corrida, data_corrida, status_entrega)
VALUES
-- 5 corridas para cada entregador (15 × 5 = 75) + 5 extras = 80

-- ENTREGADOR 1
(1,1,12.5,25,18.50,'2025-02-01','concluida'),
(2,1,8.1,20,12.20,'2025-02-02','atrasada'),
(1,1,14.4,32,21.80,'2025-02-03','cancelada'),
(3,1,9.3,22,13.70,'2025-02-04','concluida'),
(1,1,7.8,18,11.50,'2025-02-05','concluida'),

-- ENTREGADOR 2
(1,2,5.3,12,7.50,'2025-02-01','concluida'),
(4,2,9.7,22,14.30,'2025-02-02','concluida'),
(1,2,3.9,10,6.80,'2025-02-03','cancelada'),
(2,2,6.4,15,9.90,'2025-02-04','concluida'),
(1,2,8.7,19,12.10,'2025-02-05','atrasada'),

-- ENTREGADOR 3
(3,3,14.0,30,20.10,'2025-02-01','atrasada'),
(5,3,22.4,45,31.90,'2025-02-02','concluida'),
(3,3,10.1,25,15.40,'2025-02-03','concluida'),
(3,3,11.8,27,16.70,'2025-02-04','concluida'),
(2,3,9.2,21,13.40,'2025-02-05','cancelada'),

-- ENTREGADOR 4
(4,4,6.8,15,9.90,'2025-02-01','concluida'),
(4,4,7.0,18,10.20,'2025-02-02','atrasada'),
(1,4,4.5,12,7.30,'2025-02-03','cancelada'),
(2,4,8.3,19,11.90,'2025-02-04','concluida'),
(4,4,6.1,14,8.90,'2025-02-05','concluida'),

-- ENTREGADOR 5
(5,5,30.2,55,42.80,'2025-02-01','concluida'),
(2,5,11.3,26,15.70,'2025-02-02','concluida'),
(5,5,18.9,38,26.40,'2025-02-03','atrasada'),
(5,5,14.6,30,20.90,'2025-02-04','concluida'),
(3,5,9.9,22,13.50,'2025-02-05','cancelada'),

-- ENTREGADOR 6
(1,6,6.0,14,8.20,'2025-02-01','concluida'),
(3,6,13.2,28,17.40,'2025-02-02','cancelada'),
(1,6,7.1,15,10.10,'2025-02-03','concluida'),
(4,6,9.5,20,13.10,'2025-02-04','concluida'),
(2,6,10.7,23,14.80,'2025-02-05','atrasada'),

-- ENTREGADOR 7
(2,7,8.4,18,12.00,'2025-02-01','concluida'),
(2,7,7.6,16,10.90,'2025-02-02','concluida'),
(3,7,11.2,24,16.30,'2025-02-03','cancelada'),
(1,7,5.9,13,8.00,'2025-02-04','concluida'),
(4,7,9.3,21,13.80,'2025-02-05','atrasada'),

-- ENTREGADOR 8
(3,8,12.0,26,17.20,'2025-02-01','concluida'),
(3,8,13.5,29,18.90,'2025-02-02','concluida'),
(1,8,6.7,15,9.80,'2025-02-03','cancelada'),
(5,8,21.3,44,30.40,'2025-02-04','concluida'),
(3,8,11.0,24,15.80,'2025-02-05','concluida'),

-- ENTREGADOR 9
(5,9,20.5,40,29.50,'2025-02-01','concluida'),
(5,9,17.4,35,25.10,'2025-02-02','concluida'),
(2,9,9.1,19,13.20,'2025-02-03','cancelada'),
(3,9,10.5,23,15.30,'2025-02-04','concluida'),
(5,9,22.1,46,31.70,'2025-02-05','concluida'),

-- ENTREGADOR 10
(4,10,5.2,12,7.40,'2025-02-01','concluida'),
(4,10,6.4,14,8.90,'2025-02-02','concluida'),
(1,10,4.8,11,7.00,'2025-02-03','cancelada'),
(2,10,7.6,17,10.60,'2025-02-04','atrasada'),
(4,10,6.9,15,9.30,'2025-02-05','concluida'),

-- ENTREGADOR 11
(2,11,8.0,18,11.70,'2025-02-01','concluida'),
(1,11,6.3,14,9.10,'2025-02-02','concluida'),
(2,11,7.4,16,10.20,'2025-02-03','cancelada'),
(3,11,11.1,24,15.60,'2025-02-04','concluida'),
(2,11,9.0,19,12.50,'2025-02-05','concluida'),

-- ENTREGADOR 12
(3,12,13.0,28,18.20,'2025-02-01','concluida'),
(1,12,7.2,16,10.30,'2025-02-02','concluida'),
(3,12,12.1,26,17.10,'2025-02-03','atrasada'),
(4,12,9.4,20,13.40,'2025-02-04','concluida'),
(3,12,10.9,23,15.90,'2025-02-05','cancelada'),

-- ENTREGADOR 13
(1,13,9.5,20,13.40,'2025-02-01','concluida'),
(1,13,7.9,17,11.10,'2025-02-02','concluida'),
(2,13,10.1,22,14.50,'2025-02-03','cancelada'),
(3,13,11.3,25,16.80,'2025-02-04','concluida'),
(1,13,6.4,14,9.20,'2025-02-05','concluida'),

-- ENTREGADOR 14
(4,14,8.2,18,11.80,'2025-02-01','concluida'),
(4,14,9.0,20,12.80,'2025-02-02','concluida'),
(1,14,5.7,13,8.40,'2025-02-03','atrasada'),
(2,14,7.9,18,11.30,'2025-02-04','concluida'),
(4,14,8.5,19,12.10,'2025-02-05','cancelada'),

-- ENTREGADOR 15
(5,15,25.1,50,36.80,'2025-02-01','concluida'),
(5,15,18.6,38,26.90,'2025-02-02','concluida'),
(3,15,12.4,27,17.50,'2025-02-03','cancelada'),
(5,15,27.3,53,39.20,'2025-02-04','concluida'),
(2,15,9.5,21,13.90,'2025-02-05','concluida');


INSERT INTO custos_operacionais (id_cidade, combustivel_mensal, incentivos_entregadores, custo_medio_km, custo_total_mes)
VALUES
(1, 5000, 12000.00, 1.80, 35000.00),
(2, 2000, 6000.00, 1.60, 15000.00),
(3, 3200, 8000.00, 1.75, 22000.00),
(4, 2800, 7000.00, 1.70, 18000.00),
(5, 3500, 9000.00, 1.85, 26000.00);