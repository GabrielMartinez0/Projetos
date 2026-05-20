-- Basico do basico
CREATE database biblioteca_universitaria_GM1;

use biblioteca_universitaria_GM1;

CREATE table usuario (
    id_usuario int auto_increment primary key,
    nome varchar(100),
    email varchar(150) unique,
    data_cadastro date default (CURRENT_DATE),
    -- status ficava de uma cor diferente no vs, entt resolvi alterar so por garantia (deu problema no select tb)
    status_usuario enum ("ativo", "inativo") default "inativo"
);

CREATE table livro (
    id_livro int auto_increment primary key,
    titulo varchar(150) not null,
    autor varchar(100) not null,
    -- coisa interessante (e idiota) ano so vai de 1901 - 2155, oq faz sentido no caso de espaco pq ele guarda so 1 byte e soma 1900
    -- dava facilmente pra usar um smallint aq
    ano_publicacao year not null,
    categoria varchar(50) not null,
    quantidade int not null
);

CREATE table emprestimo (
    id_emprestimo int auto_increment primary key,
    fk_id_usuario int not null,
    foreign key (fk_id_usuario) references usuario (id_usuario),
    data_emprestimo date default (CURRENT_DATE),
    data_prevista date not null,
    data_devolucao date,
    status_emprestimo enum ("ativo", "devolvido", "atrasado")
);

CREATE table itens_emprestimo (
    id_item int auto_increment primary key,
    fk_id_emprestimo int not null,
    fk_id_livro int not null,
    quantidade int not null,
    foreign key (fk_id_emprestimo) references emprestimo (id_emprestimo),
    foreign key (fk_id_livro) references livro (id_livro)
);

-- conteudo diretamente da fornalha do gpt:
INSERT INTO
    usuario (nome, email, data_cadastro, status_usuario)
VALUES
    ("Alice Silva", "alice@gmail.com", "2015-03-21", "ativo"),
    ("Bruno Costa", "bruno@gmail.com", "2022-07-28", "ativo"),
    ("Carla Mendes", "carla@gmail.com", "2025-05-25", "ativo"),
    ("Daniel Souza", "daniel@gmail.com", "2010-02-12", "inativo"),
    ("Elisa Rocha", "elisa@gmail.com", "2020-12-21", "ativo");

INSERT INTO
    livro (titulo, autor, ano_publicacao, categoria, quantidade)
VALUES
    ("O Pequeno Príncipe", "Antoine de Saint-Exupéry", 1943, "Literatura", 5),
    ("1984", "George Orwell", 1949, "Distopia", 3),
    ("Dom Casmurro", "Machado de Assis", 1901, "Clássico", 4), -- ano errado, mas fazer oq, year nn me deixa colocar 1899
    ("Harry Potter e a Pedra Filosofal", "J.K. Rowling", 1997, "Fantasia", 7),
    ("O Senhor dos Anéis", "J.R.R. Tolkien", 1954, "Fantasia", 6);

INSERT INTO
    emprestimo (fk_id_usuario, data_prevista, data_devolucao, status_emprestimo)
VALUES
    (1, "2026-04-01", NULL, "ativo"),
    (2, "2026-04-05", NULL, "ativo"),
    (3, "2026-04-10", NULL, "ativo"),
    (4, "2015-02-10", "2015-03-09", "devolvido");

INSERT INTO
    itens_emprestimo (fk_id_emprestimo, fk_id_livro, quantidade)
VALUES
    (1, 1, 1), -- Alice pega "O Pequeno Príncipe"
    (1, 2, 1), -- Alice pega "1984"
    (2, 3, 2), -- Bruno pega "Dom Casmurro" x2
    (3, 4, 1), -- Carla pega "Harry Potter"
    (3, 5, 1) -- Carla pega "O Senhor dos Anéis"
;

select
    *
from
    usuario;

-- select * from livro;
-- select * from emprestimo;
-- select * from itens_emprestimo;
-- bora la, parte 4
-- ps: nunca achei q um "print" sera tao bom pra organizacao
select
    "----------------------------------- pt 4v1 -----------------------------------" as "";

update usuario
SET
    status_usuario = "ativo"
where
    id_usuario = 4;

select
    *
from
    usuario;

select
    "----------------------------------- pt 4v2 -----------------------------------" as "";

delete from usuario
where
    id_usuario = 5;

select
    *
from
    usuario;

select
    "----------------------------------- pt 5v1 -----------------------------------" as "";

select
    *
from
    emprestimo
where
    status_emprestimo = "ativo";

select
    *
from
    usuario;

select
    "----------------------------------- pt 5v2 -----------------------------------" as "";

select
    *
from
    livro
where
    categoria = "Fantasia";

select
    *
from
    usuario;

select
    "----------------------------------- pt 5v3 -----------------------------------" as "";

select
    *
from
    usuario
where
    data_cadastro < "2021-01-01";

select
    *
from
    usuario;

select
    "----------------------------------- pt 6v1 -----------------------------------" as "";

select
    count(id_livro) as quantidadeLivros
from
    livro;

select
    "----------------------------------- pt 6v2 -----------------------------------" as "";

select
    sum(quantidade) as quantidadeEstoque
from
    livro;

select
    "----------------------------------- pt 6v3 -----------------------------------" as "";

select
    categoria,
    round(avg(quantidade), 2) as quantidadeEstoque
from
    livro
group by
    categoria;

select
    "----------------------------------- pt 6v4 -----------------------------------" as "";

-- pt6 v4.1 -----------------------------------
select
    min(ano_publicacao) as "Primeiro ano de publicacao"
from
    livro;

-- pt6 v4.2 -----------------------------------
select
    max(ano_publicacao) as "Ultimo ano de publicacao"
from
    livro;

select
    "----------------------------------- pt 7v1 -----------------------------------" as "";

select
    u.nome,
    e.data_emprestimo,
    l.titulo,
    l.quantidade
from
    usuario u
    inner join emprestimo e on u.id_usuario = e.fk_id_usuario
    inner join itens_emprestimo ie on e.id_emprestimo = ie.fk_id_emprestimo
    inner join livro l on ie.fk_id_livro = l.id_livro;

select
    "----------------------------------- pt 7v2 -----------------------------------" as "";

select
    *
from
    usuario u
    left join emprestimo e on id_usuario = fk_id_usuario;

select
    "----------------------------------- pt 7v3 -----------------------------------" as "";

select
    *
from
    livro l
    left join itens_emprestimo ie on id_livro = fk_id_livro;

select
    "----------------------------------- pt 7v4 -----------------------------------" as "";

select
    u.nome,
    e.status_emprestimo,
    l.titulo,
    l.categoria,
    ie.quantidade
from
    usuario u
    inner join emprestimo e on u.id_usuario = e.fk_id_usuario
    inner join itens_emprestimo ie on e.id_emprestimo = ie.fk_id_emprestimo
    inner join livro l on ie.fk_id_livro = l.id_livro;