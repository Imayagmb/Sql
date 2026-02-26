CREATE DATABASE db_escola;

USE db_escola;

CREATE TABLE estudantes (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    turma VARCHAR(50) NOT NULL,
    portugues DECIMAL(3,1),
    matematica DECIMAL(3,1),
    historia DECIMAL(3,1),
    geografia DECIMAL(3,1),
    biologia DECIMAL(3,1),
    ingles DECIMAL(3,1),
    espanhol DECIMAL(3,1),
    filosofia DECIMAL(3,1),
    sociologia DECIMAL(3,1),
    fisica DECIMAL(3,1),
    quimica DECIMAL(3,1),
    artes DECIMAL(3,1),
    educacao_fisica DECIMAL(3,1),
    nota DECIMAL(4,2),
    data_matricula DATE,
    status VARCHAR(50)
);

-- CONSTRAINT - a nota não pode ser maior que 10
ALTER TABLE estudantes
ADD CONSTRAINT chk_nota_valida CHECK (nota <= 10);

INSERT INTO estudantes (
nome, turma,
portugues, matematica, historia, geografia, biologia,
ingles, espanhol, filosofia, sociologia, fisica, quimica, artes, educacao_fisica,
nota, data_matricula, status
)
VALUES
('Meredith Grey','3A',8,7,9,8,7,8,7,6,7,8,7,9,8,
(8+7+9+8+7+8+7+6+7+8+7+9+8)/13,'2024-02-10','Ativo'),

('Alex Karev','2B',6,5,7,6,5,6,5,6,5,6,5,6,7,
(6+5+7+6+5+6+5+6+5+6+5+6+7)/13,'2024-02-12','Ativo'),

('George OMalley','1A',7,8,6,7,8,7,6,7,6,7,8,7,6,
(7+8+6+7+8+7+6+7+6+7+8+7+6)/13,'2024-02-15','Ativo'),

('Izzie Stevens','3A',9,8,9,9,8,9,8,9,8,9,8,9,9,
(9+8+9+9+8+9+8+9+8+9+8+9+9)/13,'2024-02-18','Ativo'),

('Cristina Yang','2B',5,6,5,6,5,6,5,6,5,6,5,6,5,
(5+6+5+6+5+6+5+6+5+6+5+6+5)/13,'2024-02-20','Ativo'),

('Derek Shepherd','1A',7,7,8,7,8,7,8,7,8,7,8,7,8,
(7+7+8+7+8+7+8+7+8+7+8+7+8)/13,'2024-02-22','Ativo'),

('Miranda Bailey','3A',4,5,4,5,4,5,4,5,4,5,4,5,4,
(4+5+4+5+4+5+4+5+4+5+4+5+4)/13,'2024-02-25','Inativo'),

('Jackson Avery','2B',8,9,8,9,8,9,8,9,8,9,8,9,8,
(8+9+8+9+8+9+8+9+8+9+8+9+8)/13,'2024-02-28','Ativo');

SELECT * FROM estudantes;

SELECT nome, turma, nota
FROM estudantes
WHERE nota > 7.0;


SELECT nome, turma, nota
FROM estudantes
WHERE nota < 7.0;

SELECT 
    nome,
    turma,
    nota,
    CASE
        WHEN nota >= 7 THEN 'Aprovado'
        WHEN nota >= 5 AND nota < 7 THEN 'Recuperacao'
        ELSE 'Reprovado'
    END AS resultado_final
FROM estudantes;

-- Recalculando média da Cristina
UPDATE estudantes
SET
    portugues = 9,
    matematica = 8,
    historia = 9,
    geografia = 9,
    biologia = 8,
    ingles = 9,
    espanhol = 9,
    filosofia = 9,
    sociologia = 9,
    fisica = 8,
    quimica = 9,
    artes = 10,
    educacao_fisica = 10,
    nota = (
        9 + 8 + 9 + 9 + 8 + 9 + 9 + 9 + 9 + 8 + 9 + 10 + 10
    ) / 13
WHERE nome = 'Cristina Yang';

SELECT nome, matematica, nota
FROM estudantes
WHERE nome = 'Cristina Yang';

-- VIEW - boletim final
CREATE VIEW boletim_final AS
SELECT 
    nome,
    turma,
    nota,
    CASE
        WHEN nota >= 7 THEN 'Aprovado'
        WHEN nota >= 5 AND nota < 7 THEN 'Recuperacao'
        ELSE 'Reprovado'
    END AS resultado_final
FROM estudantes;

-- Usando a view
SELECT * FROM boletim_final;

-- Ranking da turma
SELECT nome, turma, nota
FROM estudantes
ORDER BY nota DESC;


-- Média geral da turma
SELECT AVG(nota) AS media_geral_turma
FROM estudantes;


-- Quantidade por situação (Aprovado, reprovado, recuperação)

SELECT 
    resultado_final,
    COUNT(*) AS quantidade
FROM boletim_final
GROUP BY resultado_final;

drop database db_escola;