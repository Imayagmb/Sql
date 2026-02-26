drop database db_generation_game_online;

CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

-- TABELA CLASSES
CREATE TABLE tb_classes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_classe VARCHAR(50) NOT NULL,
    tipo_ataque VARCHAR(50) NOT NULL,
    descricao VARCHAR(255)
);

-- TABELA PERSONAGENS
CREATE TABLE tb_personagens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    nivel INT NOT NULL,
    id_classe BIGINT,
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id)
);

-- INSERT CLASSES
INSERT INTO tb_classes (nome_classe, tipo_ataque, descricao) VALUES
('Corpo a Corpo', 'Fisico', 'Combate de curta distancia'),
('Longa Distancia', 'Magico', 'Ataques com projeteis'),
('Balanceado', 'Fisico', 'Ataque e defesa equilibrados'),
('Grappler', 'Fisico', 'Especialista em agarrões'),
('Velocidade', 'Fisico', 'Ataques rapidos e mobilidade alta'),
('Rushdown', 'Fisico', 'Pressão ofensiva com combos e agarrões');

-- INSERT PERSONAGENS (KOF)
INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, nivel, id_classe) VALUES
('Kyo', 1000, 800, 40, 3),
('Yashiro Nanakase', 900, 700, 45, 1),
('Rugal', 4000, 2000, 55, 3),
('K99', 2000, 1400, 45, 6),
('Kula', 2000, 1500, 43, 2),
('Chin', 1100, 1200, 40, 3),
('Hinako', 980, 1300, 39, 4),
('Iori', 2700, 1300, 46, 6),
('Kim', 2400, 1600, 44, 3),
('Mai', 1200, 900, 40, 2),
('Chang', 2300, 2200, 44, 4),
('Choi', 950, 850, 39, 5),
('Ralf', 2500, 1800, 43, 4),
('Clark', 1450, 1050, 43, 4),
('Athena', 2100, 1500, 41, 2),
('Leona', 2350, 1550, 42, 5),
('Bao', 800, 900, 38, 2);

-- SELECT CLASSES
SELECT * FROM tb_classes;

-- SELECT PERSONAGENS
SELECT * FROM tb_personagens;

-- ATAQUE > 2000
SELECT * FROM tb_personagens
WHERE poder_ataque > 2000;

-- SELECT: DEFESA ENTRE 1000 E 2000
SELECT * FROM tb_personagens
WHERE poder_defesa BETWEEN 1000 AND 2000;

-- SELECT: NOME COM LETRA C
SELECT * FROM tb_personagens
WHERE nome LIKE '%C%';

-- INNER JOIN: PERSONAGENS + CLASSES
SELECT 
    p.nome,
    p.poder_ataque,
    p.poder_defesa,
    p.nivel,
    c.nome_classe
FROM tb_personagens p
INNER JOIN tb_classes c
ON p.id_classe = c.id;

-- INNER JOIN FILTRANDO CLASSE (LONGA DISTANCIA)
SELECT 
    p.nome,
    c.nome_classe
FROM tb_personagens p
INNER JOIN tb_classes c
ON p.id_classe = c.id
WHERE c.nome_classe = 'Longa Distancia';

-- ===========
-- BONUS
-- ===========

-- RANKING DE ATAQUE 
SELECT nome, poder_ataque
FROM tb_personagens
ORDER BY poder_ataque DESC;

-- PERSONAGEM MAIS TANK (MAIOR DEFESA)
SELECT nome, poder_defesa
FROM tb_personagens
ORDER BY poder_defesa DESC
LIMIT 1;

-- 	QUANTIDADE DE PERSONAGENS POR CLASSE
SELECT c.nome_classe, COUNT(p.id) AS quantidade
FROM tb_classes c
LEFT JOIN tb_personagens p ON p.id_classe = c.id
GROUP BY c.nome_classe;

-- PERSONAGENS ACIMA DA MÉDIA DE ATAQUE
SELECT nome, poder_ataque
FROM tb_personagens
WHERE poder_ataque > (SELECT AVG(poder_ataque) FROM tb_personagens);