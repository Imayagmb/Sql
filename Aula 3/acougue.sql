drop database db_cidade_das_carnes;
CREATE DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;

-- Tab Categorias
CREATE TABLE tb_categorias (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    origem VARCHAR(100)
);

-- Tab produtos
CREATE TABLE tb_produtos (
    id BIGINT  PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    peso DECIMAL(5,2),
    validade DATE,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);


-- INSERINDO 5 REGISTROS EM CATEGORIAS
INSERT INTO tb_categorias (nome, descricao, origem) values
('Bonivos', 'Carnes proveniente de boi', 'Nacional'),
('Suínos', ' Carnes provenientes de porco', 'Nacional'),
('Aves', 'Carnes de frangos e outras aves', 'Granja'),
('Embutidos', 'Produtos processados e embutidos', 'Industrial'),
('Cortes Especiais', 'Cortes nobres e premium', 'Importado');

-- INSERINDO 8 REGRISTROS EM PRODUTOS
INSERT INTO tb_produtos (nome, preco, peso, validade, categoria_id) VALUES 
('Picanha', 220.00, 2.20, '2026-03-10', 5),
('Alcantra', 65.00, 1.00, '2026-03-08', 1),
('Costela Bovina', 55.00, 2.00, '2026-03-12', 1),
('Frango Inteiro', 25.00, 2.50, '2026-03-05', 3),
('Linguiça Calabresa', 30.00, 1.00, '2026-04-01', 4),
('Costela Suína', 48.00, 1.80, '2026-03-09', 2),
('Cupim', 75.00, 1.50, '2026-03-11', 5),
('Coxinha da Asa', 22.00, 1.00, '2026-03-06', 3),
('Coxa pião', 10.00, 1.00, '2026-06-06', 3),
('Asinha de frango', 25.00, 1.00, '2026-03-06', 3);


select * from tb_categorias;
select * from tb_produtos;

-- SELECT: PRODUTOS COM VALOR MAIOR QUE 50
SELECT * FROM tb_produtos
WHERE preco > 50.00;

-- PRODUTOS COM VALOR ENTRE 50 E 150
SELECT * FROM tb_produtos 
WHERE preco BETWEEN 50.00 AND 150.00;

-- PRODUTOS QUE POSSUEM A LETRA "C"
SELECT * FROM tb_produtos
WHERE nome LIKE '%C%';

-- SELECT COM INNER JOIN (UNINDO PRODUTOS E CATEGORIAS)
SELECT p.id, p.nome, p.preco, c.nome AS categoria
FROM tb_produtos p INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- SELECT COM INNER JOIN FILTRANDO POR CATEGORIA ESPECÍFICA 
select p.id, p.nome, p.preco, c.nome as categoria
from tb_produtos p inner join tb_categorias c on p.categoria_id = c.id where c.nome = 'aves';


