CREATE TABLE estado( 
    sigla char(2) NOT NULL UNIQUE, 
    nome varchar(100) NOT NULL, 
    PRIMARY KEY(sigla) 
);

CREATE TABLE pessoa(
    id int AUTO_INCREMENT,
    name varchar(100),
    cpf varchar(11) UNIQUE,
    estado_sigla char(2),
    nacionalidade varchar(20) DEFAULT 'brasileira',
    PRIMARY KEY (id),
    FOREIGN KEY (estado_sigla) REFERENCES estado(sigla)
);

ALTER TABLE pessoa ADD rua varchar(50);

ALTER TABLE pessoa CHANGE COLUMN name nomeCompleto varchar(50);

ALTER TABLE pessoa DROP rua;
