-- Cria o database;
DROP DATABASE avaliacao2;
CREATE DATABASE avaliacao2;

-- Seleciona o database;
USE avaliacao2;

-- Cria todas as tabelas sem as chaves estrangeiras;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` INT AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL UNIQUE,
  `password` TINYTEXT NULL,
  `nomeCompleto` VARCHAR(100) NULL,
  `dataRegistro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `imagem` BLOB NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `disciplinas` (
  `id` INT AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `professor_da_disciplina` (
  `id` INT AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `disciplina_id` int  NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `planos_de_aulas` (
  `id` INT AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `tema` TINYTEXT NULL,
  `duracao` INT NULL,
  `recursos` TEXT NULL,
  `referencia` TEXT NULL,
  `objetivos` TEXT NULL,
  `avaliacao` TEXT NULL,
  `metodologia` TEXT NULL,
  `publico` BOOLEAN NOT NULL DEFAULT '0',
  `usuario_id` INT NOT NULL,
  `disciplina_id` INT NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `conteudos` (
  `id` INT AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `disciplina_id` INT NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `conteudos_dos_planos` (
  `id` INT AUTO_INCREMENT,
  `plano_id` int NOT NULL,
  `conteudo_id` int  NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `comentarios` (
  `id` INT AUTO_INCREMENT,
  `texto` TEXT NOT NULL,
  `data` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `plano_id` INT NULL,
  `comentario_id` INT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `planos_compartilhados` (
  `id` INT AUTO_INCREMENT,
  `acesso` VARCHAR(20) NOT NULL,
  `plano_id` INT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`)
);

-- Cria as chaves estrangeiras nas tabelas;
    -- Tabela professor_da_disciplina;
ALTER TABLE professor_da_disciplina ADD CONSTRAINT `pfdd_fk_professor` FOREIGN KEY(usuario_id) REFERENCES usuarios(id);
ALTER TABLE professor_da_disciplina ADD CONSTRAINT `pfdd_fk_disciplina` FOREIGN KEY(disciplina_id) REFERENCES disciplinas(id);

    -- Tabela Conteudos;
ALTER TABLE conteudos ADD CONSTRAINT `conteudo_fk_disciplina` FOREIGN KEY(disciplina_id) REFERENCES disciplinas(id);

    -- Tabela planos_de_aulas;
ALTER TABLE planos_de_aulas ADD CONSTRAINT `pda_fk_professor` FOREIGN KEY(usuario_id) REFERENCES usuarios(id);
ALTER TABLE planos_de_aulas ADD CONSTRAINT `pda_fk_disciplina` FOREIGN KEY(disciplina_id) REFERENCES disciplinas(id);

    -- Tabela conteudo_dos_planos;
ALTER TABLE conteudos_dos_planos ADD CONSTRAINT `cdp_fk_conteudo` FOREIGN KEY(conteudo_id) REFERENCES conteudos(id);
ALTER TABLE conteudos_dos_planos ADD CONSTRAINT `cdp_fk_plano` FOREIGN KEY(plano_id) REFERENCES planos_de_aulas(id);

    -- Tabela planos_compartilhados;
ALTER TABLE planos_compartilhados ADD CONSTRAINT `pc_fk_professor` FOREIGN KEY(usuario_id) REFERENCES usuarios(id);
ALTER TABLE planos_compartilhados ADD CONSTRAINT `pc_fk_plano` FOREIGN KEY(plano_id) REFERENCES planos_de_aulas(id);

    -- Tabela comentarios;
ALTER TABLE comentarios ADD CONSTRAINT `c_fk_plano` FOREIGN KEY(plano_id) REFERENCES planos_de_aulas(id);
ALTER TABLE comentarios ADD CONSTRAINT `c_fk_usuario` FOREIGN KEY(usuario_id) REFERENCES usuarios(id);
ALTER TABLE comentarios ADD CONSTRAINT `c_fk_comentario` FOREIGN KEY(comentario_id) REFERENCES comentarios(id);
