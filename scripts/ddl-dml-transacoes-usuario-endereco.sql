CREATE DATABASE bd3;

USE bd3;

CREATE TABLE usuario(
	usuario_id INT AUTO_INCREMENT 
  , user_name  VARCHAR(30)
  , email      VARCHAR(100)
  , PRIMARY KEY (usuario_id) 
);

CREATE TABLE endereco(
	endereco_id INT AUTO_INCREMENT PRIMARY KEY
  , endereco    VARCHAR(200)
  , cidade      VARCHAR(100)
  , cep         VARCHAR(8)
  , usuario_id  INT 
  , FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
);

INSERT INTO usuario (user_name, email)
     VALUES ('diego', 'diego.neri@etec.sp.gov.br');

INSERT INTO endereco (endereco, cidade, cep, usuario_id)
     VALUES ('Avenida Monteiro Lobato, 8000', 'Mongaguá', '11730-000', LAST_INSERT_ID());
