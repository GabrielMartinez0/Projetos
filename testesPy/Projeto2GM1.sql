CREATE TABLE aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    data_nascimento DATE,
    matricula_ativa BOOLEAN DEFAULT TRUE
);

CREATE TABLE disciplina (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) UNIQUE,
    carga_horaria INT,
    professor VARCHAR(100)
);

CREATE TABLE matricula (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_aluno INT NOT NULL,
    fk_id_disciplina INT NOT NULL,
    data_matricula DATE,
    semestre VARCHAR(10),
    FOREIGN KEY (fk_id_aluno) REFERENCES aluno (id_aluno),
    FOREIGN KEY (fk_id_disciplina) REFERENCES disciplina (id_disciplina)
);

CREATE TABLE nota (
    id_nota INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_matricula INT NOT NULL,
    valor_nota DECIMAL(3, 2),
    data_avaliacao DATE,
    tipo_avaliacao VARCHAR(50),
    FOREIGN KEY (fk_id_matricula) REFERENCES matricula (id_matricula)
);

INSERT INTO
    aluno (nome, email, data_nascimento, matricula_ativa)
VALUES
    ('Ana Silva', 'ana@escola.com', '2006-05-15', TRUE),
    ('Bruno Costa', 'bruno@escola.com', '2005-08-22', TRUE),
    ('Carlos Ferreira', 'carlos@escola.com', '2006-03-10', TRUE),
    ('Diana Santos', 'diana@escola.com', '2005-11-30', FALSE),
    ('Everton Oliveira', 'everton@escola.com', '2006-07-08', TRUE);

INSERT INTO
    disciplina (nome, codigo, carga_horaria, professor)
VALUES
    ('Matemática', 'MAT101', 60, 'Prof. João Silva'),
    ('Português', 'PORT102', 60, 'Profa. Maria Santos'),
    ('Física', 'FIS103', 45, 'Prof. Roberto Costa'),
    ('História', 'HIST104', 45, 'Prof. Lucas Martins'),
    ('Educação Física', 'EDF105', 30, 'Prof. André Pereira');

INSERT INTO
    matricula (fk_id_aluno, fk_id_disciplina, data_matricula, semestre)
VALUES
    (1, 1, '2024-01-15', '2024/1'), -- Ana em Matemática
    (1, 2, '2024-01-15', '2024/1'), -- Ana em Português
    (2, 1, '2024-01-15', '2024/1'), -- Bruno em Matemática
    (2, 3, '2024-01-15', '2024/1'), -- Bruno em Física
    (3, 2, '2024-01-15', '2024/1'), -- Carlos em Português
    (3, 4, '2024-01-15', '2024/1'), -- Carlos em História
    (4, 1, '2024-01-15', '2024/1'), -- Diana em Matemática
    (5, 5, '2024-01-15', '2024/1');

-- Everton em Educação Física
INSERT INTO
    nota (fk_id_matricula, valor_nota, data_avaliacao, tipo_avaliacao)
VALUES
    (1, 8.5, '2024-03-10', 'Prova'),
    (1, 7.8, '2024-04-15', 'Trabalho'),
    (2, 9.0, '2024-03-12', 'Prova'),
    (3, 7.2, '2024-03-10', 'Prova'),
    (3, 8.1, '2024-04-20', 'Trabalho'),
    (4, 6.5, '2024-03-15', 'Prova'),
    (5, 8.9, '2024-03-12', 'Prova'),
    (6, 8.3, '2024-03-18', 'Prova'),
    (7, 7.0, '2024-03-10', 'Prova'),
    (8, 9.5, '2024-03-20', 'Prova');

-- ex1
-- pt1
select
    a.nome,
    d.nome
from
    aluno a
    join matricula m on a.id_aluno = m.fk_id_aluno
    join disciplina d on m.fk_id_disciplina = id_disciplina;

-- pt2
select
    a.nome,
    d.nome,
    n.valor_nota
from
    aluno a
    join matricula m on a.id_aluno = m.fk_id_aluno
    join disciplina d on m.fk_id_disciplina = id_disciplina
    join nota n on m.id_matricula = n.fk_id_matricula;

-- pt3
select
    a.nome,
    d.professor,
    d.nome as disciplina
from
    aluno a
    join matricula m on a.id_aluno = m.fk_id_aluno
    join disciplina d on m.fk_id_disciplina = id_disciplina
where
    a.matricula_ativa;

-- ex2
-- pt1
-- complicado de testar quando todas as disciplinas tem pelo menos 1 aluno
select
    a.nome,
    d.nome as disciplina
from
    disciplina d
    left join matricula m on m.fk_id_disciplina = id_disciplina
    left join aluno a on a.id_aluno = m.fk_id_aluno;

-- pt2
-- vou nem comentar sobre a msm coisa dnv kkkkkkk
select
    a.nome,
    d.nome as disciplina
from
    aluno a
    left join matricula m on a.id_aluno = m.fk_id_aluno
    left join disciplina d on m.fk_id_disciplina = id_disciplina;

-- pt3
select
    m.id_matricula,
    n.valor_nota
from
    matricula m
    left join nota n on n.fk_id_matricula = m.id_matricula
where
    n.valor_nota is NULL;

-- ex3
-- pt1
SELECT
    a.nome,
    n.valor_nota
FROM
    aluno a
    RIGHT JOIN matricula m ON a.id_aluno = m.fk_id_aluno
    RIGHT JOIN nota n ON m.id_matricula = n.fk_id_matricula;

-- pt2
SELECT
    n.valor_nota,
    a.nome,
    d.nome AS disciplina
FROM
    aluno a
    RIGHT JOIN matricula m ON a.id_aluno = m.fk_id_aluno
    RIGHT JOIN nota n ON m.id_matricula = n.fk_id_matricula
    LEFT JOIN disciplina d ON m.fk_id_disciplina = d.id_disciplina;

-- 4
-- pt1
SELECT
    a.nome,
    d.nome AS disciplina
FROM
    aluno a
    LEFT JOIN matricula m ON a.id_aluno = m.fk_id_aluno
    LEFT JOIN disciplina d ON m.fk_id_disciplina = d.id_disciplina
UNION
SELECT
    a.nome,
    d.nome AS disciplina
FROM
    aluno a
    RIGHT JOIN matricula m ON a.id_aluno = m.fk_id_aluno
    RIGHT JOIN disciplina d ON m.fk_id_disciplina = d.id_disciplina;

-- pt2
SELECT
    m.id_matricula,
    n.valor_nota
FROM
    matricula m
    LEFT JOIN nota n ON m.id_matricula = n.fk_id_matricula
UNION
SELECT
    m.id_matricula,
    n.valor_nota
FROM
    matricula m
    RIGHT JOIN nota n ON m.id_matricula = n.fk_id_matricula;

-- ex5
-- pt1
SELECT
    a.nome,
    d.nome AS disciplina
FROM
    aluno a
    CROSS JOIN disciplina d
WHERE
    a.matricula_ativa = TRUE;

-- pt2
SELECT
    a.nome AS aluno,
    d.nome AS disciplina
FROM
    aluno a
    CROSS JOIN disciplina d
WHERE
    a.matricula_ativa = TRUE;

-- ex6
-- pt1
SELECT
    a.nome,
    d.nome AS disciplina,
    ROUND(AVG(n.valor_nota), 2) AS media
FROM
    aluno a
    LEFT JOIN matricula m ON a.id_aluno = m.fk_id_aluno
    LEFT JOIN disciplina d ON m.fk_id_disciplina = d.id_disciplina
    LEFT JOIN nota n ON m.id_matricula = n.fk_id_matricula
GROUP BY
    a.nome,
    d.nome;

-- pt2
SELECT
    a.nome,
    COUNT(DISTINCT m.fk_id_disciplina) AS total_disciplinas,
    ROUND(AVG(n.valor_nota), 2) AS media_geral
FROM
    aluno a
    LEFT JOIN matricula m ON a.id_aluno = m.fk_id_aluno
    LEFT JOIN nota n ON m.id_matricula = n.fk_id_matricula
GROUP BY
    a.nome;

-- pt3
SELECT
    a.nome
FROM
    aluno a
    JOIN matricula m ON a.id_aluno = m.fk_id_aluno
    LEFT JOIN nota n ON m.id_matricula = n.fk_id_matricula
WHERE
    n.id_nota IS NULL;

-- pt4
SELECT
    d.nome AS disciplina,
    COUNT(DISTINCT m.fk_id_aluno) AS total_alunos,
    ROUND(AVG(n.valor_nota), 2) AS media_turma
FROM
    disciplina d
    LEFT JOIN matricula m ON d.id_disciplina = m.fk_id_disciplina
    LEFT JOIN nota n ON m.id_matricula = n.fk_id_matricula
GROUP BY
    d.nome;