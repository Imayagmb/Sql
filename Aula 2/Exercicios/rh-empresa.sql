drop database db_rh;
CREATE DATABASE db_rh;
USE db_rh;

CREATE TABLE colaboradores (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    data_admissao DATE,
    departamento VARCHAR(100)
);

INSERT INTO colaboradores (nome, cargo, salario, data_admissao, departamento) VALUES 
('Astrojildo Pereira', 'Analista de RH', 2500.00, '2023-03-10', 'RH'),
('Getulio Vargas', 'Assistente Administrativo', 1800.00, '2022-01-05', 'Administrativo'),
('Anna Amelia', 'Desenvolvedor JR', 3950.00, '2020-07-22', 'TI'),
('Daltro Santos', 'Estagiario', 1200.00, '2025-11-04', 'RH'),
('Joao Salim Miguel', 'Coordenador de RH', 4000.00, '2015-01-22', 'RH');


SELECT * FROM colaboradores;

-- SALÁRIO MAIOR QUE 2000
SELECT * FROM colaboradores
WHERE salario > 2000;

-- SALÁRIO MENOR QUE 2000
SELECT * FROM colaboradores
WHERE salario < 2000;

-- ATUALIZANDO UM REGISTRO
UPDATE colaboradores
SET salario = 2000.00
WHERE nome = 'Getulio Vargas';

SELECT * FROM colaboradores
WHERE nome = 'Getulio Vargas';

-- MÉDIA SALARIAL
SELECT AVG(salario) AS media_salarial
FROM colaboradores;

-- MAIOR E MENOR SALÁRIO
SELECT 
    MAX(salario) AS maior_salario,
    MIN(salario) AS menor_salario
FROM colaboradores;

-- QUANTIDADE DE FUNCIONÁRIOS POR DEPARTAMENTO
SELECT departamento, COUNT(*) AS total_funcionarios
FROM colaboradores
GROUP BY departamento;

-- FOLHA SALARIAL POR DEPARTAMENTO
SELECT 
    departamento,
    SUM(salario) AS total_folha
FROM colaboradores
GROUP BY departamento;

-- TEMPO DE EMPRESA (EM ANOS)
SELECT 
    nome,
    data_admissao,
    TIMESTAMPDIFF(YEAR, data_admissao, CURDATE()) AS anos_empresa
FROM colaboradores;

-- CLASSIFICAÇÃO SALARIAL (CASE)
SELECT 
    nome,
    salario,
    CASE
        WHEN salario >= 4000 THEN 'Alto'
        WHEN salario >= 2000 THEN 'Médio'
        ELSE 'Baixo'
    END AS faixa_salarial
FROM colaboradores;

-- TOP 3 MAIORES SALÁRIOS
SELECT nome, salario
FROM colaboradores
ORDER BY salario DESC
LIMIT 3;

-- FUNCIONÁRIO MAIS ANTIGO
SELECT nome, data_admissao
FROM colaboradores
ORDER BY data_admissao ASC
LIMIT 1;

-- AUMENTO DE 10% PARA O RH
UPDATE colaboradores
SET salario = salario * 1.10
WHERE departamento = 'RH';

-- VIEW RELATÓRIO DE COLABORADORES
CREATE VIEW vw_relatorio_colaboradores AS
SELECT 
    nome,
    cargo,
    departamento,
    salario,
    TIMESTAMPDIFF(YEAR, data_admissao, CURDATE()) AS anos_empresa,
    CASE
        WHEN salario >= 4000 THEN 'Salário Alto'
        WHEN salario >= 2000 THEN 'Salário Médio'
        ELSE 'Salário Baixo'
    END AS classificacao
FROM colaboradores;

-- USANDO A VIEW
SELECT * FROM vw_relatorio_colaboradores;