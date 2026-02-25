CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE produtos (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT,
    data_cadastro DATE
);

INSERT INTO produtos (nome, categoria, preco, estoque, data_cadastro) VALUES
('Notebook Dell', 'Eletrônicos', 3500.00, 10, '2025-01-10'),
('Smartphone Samsung', 'Eletrônicos', 2200.00, 15, '2025-01-12'),
('Fone de Ouvido JBL', 'Acessórios', 450.00, 30, '2025-01-15'),
('Mouse Gamer', 'Acessórios', 150.00, 50, '2025-01-18'),
('Cadeira Gamer', 'Móveis', 1200.00, 5, '2025-01-20'),
('Monitor LG', 'Eletrônicos', 980.00, 8, '2025-01-22'),
('Teclado Mecânico', 'Acessórios', 600.00, 20, '2025-01-25'),
('HD Externo 1TB', 'Armazenamento', 480.00, 12, '2025-01-28');

SELECT 
    nome,
    categoria,
    CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS preco_formatado,
    estoque,
    DATE_FORMAT(data_cadastro, '%d/%m/%Y') AS data_cadastro_br
FROM produtos;

SELECT 
    nome,
    categoria,
    CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS preco_formatado,
    estoque,
    DATE_FORMAT(data_cadastro, '%d/%m/%Y') AS data_cadastro_br
FROM produtos
WHERE preco > 500;

SELECT 
    nome,
    categoria,
    CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS preco_formatado,
    estoque,
    DATE_FORMAT(data_cadastro, '%d/%m/%Y') AS data_cadastro_br
FROM produtos
WHERE preco < 500;

UPDATE produtos
SET preco = 180.00
WHERE nome = 'Mouse Gamer';

SELECT * FROM produtos
WHERE nome = 'Mouse Gamer';