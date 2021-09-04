USE avaliacao2;
INSERT INTO usuarios (email) VALUES 
    ('a@gmail.com'),
    ('b@gmail.com'),
    ('c@gmail.com'),
    ('d@gmail.com'),
    ('e@gmail.com'),
    ('f@gmail.com'),
    ('g@gmail.com'),
    ('h@gmail.com'),
    ('i@gmail.com'),
    ('j@gmail.com');

INSERT INTO disciplinas (nome) VALUES
    ('Física'),
    ('Química'),
    ('Biologia'),
    ('Matemática'),
    ('Português'),
    ('Educação Física'),
    ('Inglês'),
    ('Espanhol'),
    ('Geografia'),
    ('História'),
    ('Filosofia');
INSERT INTO professor_da_disciplina (usuario_id, disciplina_id) VALUES 
    ('10', '3'),
    ('10', '1'),
    ('1', '4'),
    ('1', '1'),
    ('3', '2'),
    ('4', '9'),
    ('5', '8'),
    ('8', '8'),
    ('9', '10'),
    ('7', '10');

INSERT INTO conteudos (nome, disciplina_id) VALUES
    ('Mecânica', 1),
    ('Ácidos e Bases', 2),
    ('Termodinâmica', 1),
    ('Verbos', 7),
    ('Verbos', 5),
    ('População', 9),
    ('Revolução Industrial', 10),
    ('Fração', 4),
    ('Evolução', 3),
    ('Dinâmica', 1);

INSERT INTO planos_de_aulas (titulo, usuario_id, disciplina_id) VALUES
    ('Aula 1', 1, 1),
    ('Aula 2', 1, 1),
    ('Aula 3', 1, 1),
    ('Aula 4', 1, 1),
    ('Aula 5', 1, 1),
    ('Aula 6', 1, 1),
    ('Aula 7', 1, 1),
    ('Aula 8', 1, 1),
    ('Aula 9', 1, 1),
    ('Aula 10', 1, 1);

INSERT INTO conteudos_dos_planos (plano_id, conteudo_id) VALUES
    (1, 1),
    (1, 10),
    (2, 1),
    (2, 10),
    (3, 1),
    (3, 10),
    (4, 1),
    (4, 10),
    (5, 1),
    (5, 10),
    (6, 1),
    (6, 10),
    (7, 1),
    (7, 10);

INSERT INTO comentarios (texto, plano_id, usuario_id) VALUES
    ('Que aula merda', 1, 2),
    ('Eu faria melhor', 1, 3),
    ('Eu gostei', 1, 5),
    ('Façam melhor e não reclamem', 1, 1),
    ('Grosso', 1, 4);

INSERT INTO comentarios (texto, comentario_id, usuario_id) VALUES
    ('Que aula merda 2', 1, 2),
    ('Eu faria melhor 2', 2, 3),
    ('Eu gostei 2', 3, 5),
    ('Façam melhor e não reclamem 2', 4, 1),
    ('Grosso 2', 5, 4);

INSERT INTO planos_compartilhados (acesso, plano_id, usuario_id) VALUES
    ('editor', 1 , 10),
    ('editor', 2 , 10),
    ('editor', 3 , 10),
    ('editor', 4 , 10),
    ('editor', 5 , 10),
    ('editor', 6 , 10),
    ('editor', 7 , 10),
    ('editor', 8 , 10),
    ('editor', 9 , 10),
    ('leitor', 10 , 10);