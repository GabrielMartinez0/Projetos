CREATE DATABASE fotogrid;

USE fotogrid;

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    nome_completo VARCHAR(150) NOT NULL,
    nome_usuario VARCHAR(50) NOT NULL,
    bio VARCHAR(200),
    data_inscricao DATE NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    categoria_fotografia VARCHAR(50)
);

CREATE TABLE foto (
    id_foto INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    descricao TEXT,
    fk_id_usuario INT NOT NULL,
    data_upload DATE NOT NULL,
    numero_curtidas INT DEFAULT 0,
    numero_comentarios INT DEFAULT 0,
    FOREIGN KEY (fk_id_usuario) REFERENCES usuario (id_usuario)
);

CREATE TABLE curtida (
    id_curtida INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_usuario INT NOT NULL,
    fk_id_foto INT NOT NULL,
    data_curtida DATETIME NOT NULL,
    FOREIGN KEY (fk_id_usuario) REFERENCES usuario (id_usuario),
    FOREIGN KEY (fk_id_foto) REFERENCES foto (id_foto)
);

CREATE TABLE comentario (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_usuario INT NOT NULL,
    fk_id_foto INT NOT NULL,
    texto TEXT NOT NULL,
    data_comentario DATETIME NOT NULL,
    FOREIGN KEY (fk_id_usuario) REFERENCES usuario (id_usuario),
    FOREIGN KEY (fk_id_foto) REFERENCES foto (id_foto)
);

CREATE TABLE seguidor (
    id_seguidor INT AUTO_INCREMENT PRIMARY KEY,
    fk_id_usuario INT NOT NULL,
    fk_id_usuario_seguindo INT NOT NULL,
    data_seguimento DATE NOT NULL,
    FOREIGN KEY (fk_id_usuario) REFERENCES usuario (id_usuario),
    FOREIGN KEY (fk_id_usuario_seguindo) REFERENCES usuario (id_usuario)
);

-- atividades
-- bora la 
-- Ex2 que na verdade é o 1
CREATE INDEX idx_usuario_email ON usuario (email);

CREATE INDEX idx_foto_usuario
-- (jurava q fk ja tinha indice automatico)
ON foto (fk_id_usuario);

CREATE INDEX idx_curtida_foto ON curtida (fk_id_foto);

CREATE INDEX idx_comentario_foto ON comentario (fk_id_foto);

CREATE INDEX idx_foto_data ON foto (data_upload);

CREATE INDEX idx_foto_data ON curtida (fk_id_usuario, fk_id_foto);

-- Ex3 que na verdade é o 2
CREATE VIEW fotos_populares AS
SELECT
    f.titulo AS titulo_foto,
    u.nome_usuario AS autor,
    f.numero_curtidas,
    f.numero_comentarios,
    f.data_upload
FROM
    foto f
    JOIN usuario u ON f.fk_id_usuario = u.id_usuario
ORDER BY
    f.numero_curtidas DESC
LIMIT
    10;

-- Ex2.1 (nada confusa essa numeracao ai viu)
CREATE VIEW fotos_populares AS
SELECT
    f.titulo AS titulo_foto,
    u.nome_usuario AS autor,
    f.numero_curtidas,
    f.numero_comentarios,
    f.data_upload
FROM
    foto f
    JOIN usuario u ON f.fk_id_usuario = u.id_usuario
ORDER BY
    f.numero_curtidas DESC
LIMIT
    10;

-- Ex2.2
CREATE VIEW atividade_usuario AS
SELECT
    u.nome_usuario,
    u.email,
    COUNT(DISTINCT f.id_foto) AS total_fotos,
    SUM(f.numero_curtidas) AS total_curtidas_recebidas,
    COUNT(DISTINCT s.id_seguidor) AS total_seguidores
FROM
    usuario u
    LEFT JOIN foto f ON u.id_usuario = f.fk_id_usuario
    LEFT JOIN seguidor s ON u.id_usuario = s.fk_id_usuario_seguindo
GROUP BY
    u.id_usuario,
    u.nome_usuario,
    u.email;

-- Ex2.3
CREATE VIEW fotos_com_comentarios AS
SELECT
    f.titulo AS titulo_foto,
    uf.nome_usuario AS autor,
    f.data_upload,
    c.texto AS texto_comentario,
    uc.nome_usuario AS autor_comentario,
    c.data_comentario
FROM
    comentario c
    JOIN foto f ON c.fk_id_foto = f.id_foto
    JOIN usuario uf ON f.fk_id_usuario = uf.id_usuario
    JOIN usuario uc ON c.fk_id_usuario = uc.id_usuario;

-- Ex2.4
CREATE VIEW fotografos_influenciadores AS
SELECT
    u.nome_usuario,
    u.nome_completo,
    u.categoria_fotografia,
    COUNT(DISTINCT s.id_seguidor) AS total_seguidores,
    SUM(f.numero_curtidas) AS total_curtidas_recebidas,
    COUNT(DISTINCT f.id_foto) AS total_fotos
FROM
    usuario u
    LEFT JOIN foto f ON u.id_usuario = f.fk_id_usuario
    LEFT JOIN seguidor s ON u.id_usuario = s.fk_id_usuario_seguindo
WHERE
    u.ativo = TRUE
GROUP BY
    u.id_usuario,
    u.nome_usuario,
    u.nome_completo,
    u.categoria_fotografia
HAVING
    total_seguidores > 3
    AND total_curtidas_recebidas > 10;
