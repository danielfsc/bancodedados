CREATE TABLE contatos(
    id int AUTO_INCREMENT,
    nome varchar(60) NOT NULL,
    empresa varchar(255) NOT NULL,
    cargo varchar(255) NOT NULL,
    imagem blob NULL,
    PRIMARY KEY(id)
);

CREATE TABLE tipos(
    id int AUTO_INCREMENT,
    caracteristica varchar(60) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE telefones(
    id int AUTO_INCREMENT,
    numero varchar(9) NOT NULL,
    ddd varchar(2) NULL,
    ddi varchar(2) NULL,
    contato_id int NOT NULL,
    tipo_id int NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE enderecos(
    id int AUTO_INCREMENT,
    endereco varchar(255) NOT NULL,
    cidade varchar(255) NULL,
    estado varchar(255) NULL,
    pais varchar(50) NULL,
    cep varchar(8) NULL,
    contato_id int NOT NULL,
    tipo_id int NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE enderecos ADD CONSTRAINT `end_fk_tipo` FOREIGN KEY(tipo_id) REFERENCES tipos(id);
ALTER TABLE enderecos ADD CONSTRAINT `end_fk_contato` FOREIGN KEY(contato_id) REFERENCES contatos(id);

ALTER TABLE telefones ADD CONSTRAINT `tel_fk_tipo` FOREIGN KEY(tipo_id) REFERENCES tipos(id);
ALTER TABLE telefones ADD CONSTRAINT `tel_fk_contato` FOREIGN KEY(contato_id) REFERENCES contatos(id);