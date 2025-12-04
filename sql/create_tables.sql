
USE logistica_99;

CREATE TABLE cidades
(
    id_cidade BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    regiao VARCHAR(50) NOT NULL,
    demanda_media_dia INT,
    nivel_prioridade VARCHAR(50)
);

CREATE TABLE entregadores
(
    id_entregador BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_cidade BIGINT,
    nome VARCHAR(100) NOT NULL,
    tipo_veiculo VARCHAR(50) NOT NULL,
    avaliacao DECIMAL(3,1),
    horas_trabalhadas_mes FLOAT,

    FOREIGN KEY (id_cidade) REFERENCES cidades(id_cidade)
);

CREATE TABLE corridas
(
    id_corrida BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_cidade BIGINT,
    id_entregador BIGINT,
    distancia_km FLOAT,
    tempo_min FLOAT,
    valor_corrida DECIMAL(10,2) NOT NULL,
    data_corrida DATE,
    status_entrega VARCHAR(100),

    FOREIGN KEY (id_cidade) REFERENCES cidades(id_cidade),
    FOREIGN KEY (id_entregador) REFERENCES entregadores(id_entregador)
);

CREATE TABLE custos_operacionais
(
    id_custo BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_cidade BIGINT,
    combustivel_mensal FLOAT,
    incentivos_entregadores DECIMAL(10,2),
    custo_medio_km DECIMAL(10,2),
    custo_total_mes DECIMAL(10,2),

    FOREIGN KEY (id_cidade) REFERENCES cidades(id_cidade)
);
