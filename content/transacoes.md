# Transações

[📽 Veja esta vídeo-aula no Youtube](_EM BREVE_)

## O que é uma transação

Pode-se definir como uma transação, uma ou mais operações executadas de forma a cumprir um determinado objetivo.
Todas as operações de uma determinada transação devem ser executadas com sucesso, caso contrário, não teremos uma operação bem-sucedida.

`Exemplo de uma transação`

Quero cadastrar um usuário e seu endereço, em um formulário de cadastro rápido de compra. Para isso, o usuário executa as seguintes operações:

1. Usuário preenche seu usuário e e-mail
2. Usuário preenche seus dados de endereço
3. Usuário clica em "Enviar"

Neste cenário, temos o modelo relacional abaixo:

```text
+-----------------------------+                   +--------------------------------+
|        usuario              |                   |          endereco              |
+-----------------------------+                   +--------------------------------+
| (pk) usuario_id INT auto_inc|                   |  (PK)endereco_id INT auto_inc  |
|      user_name  VARCHAR(30) |                  /|      endereco    VARCHAR(200)  |
|      email      VARCHAR(100)|-||--------------|-|      cidade      VARCHAR(100)  |
|                             |                  \|      cep         VARCHAR(8)    |
|                             |                   |  (FK)usuario_id  INT           |
+-----------------------------+                   +--------------------------------+
```

```sql
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
```

Dado que um usuário precisa ser cadastrado no mesmo momento que o endereço, como garantir que ambos os cadastros foram efetuados, dados os passos acima?

Tecnicamente falando, são dois inserts que ocorrem, um em cada tabela.
Mas se o usuário for criado com sucesso e houver um erro na criação do endereço? Como garantir que o usuário não seja criado?

```text
Com uma transação que garanta a integridade da operação, tratando as operações de forma atômica. (atomicidade)
```

💡 Veja mais sobre ACID:

* Alura - O que é ACID?

[![Alura - o que é ACID?](https://img.youtube.com/vi/NtOBPtlnK8w/0.jpg)](https://www.youtube.com/watch?v=NtOBPtlnK8w)

* [Wikipedia](https://pt.wikipedia.org/wiki/ACID), e;
* [Leitura rápida](https://medium.com/opensanca/o-que-%C3%A9-acid-59b11a81e2c6), de Pedro Barros, no Medium.

## Contexto transacional

No exemplo acima, temos o contexto transacional para cadastro de um usuário e seu endereço, que envolvem dois comandos a serem executados na base de dados:

```sql
INSERT INTO usuario (user_name, email)
     VALUES ('diego', 'diego.neri@etec.sp.gov.br');

INSERT INTO endereco (endereco, cidade, cep, usuario_id)
     VALUES ('Avenida Monteiro Lobato, 8000', 'Mongaguá', '11730-000', LAST_INSERT_ID());
```

💡 [LAST_INSERT_ID()](<https://dev.mysql.com/doc/refman/8.0/en/information-functions.html#function_last-insert-id>)

Mas, como garantir que ambos estejam em uma mesma transação?
`Tratando os comandos como únicos, contendo-os a um bloco de comandos`

## Bloco de comandos - implementando transações

---

```Se alguma operação dentro de uma transação falhar, TODA a transação falhará e deve ser revertida no banco de dados. 
Caso todas as operações tenham sucesso, elas devem ser efetivadas no banco de dados
```

---

### Estrutura básica

```sql
INICIO DA TRANSAÇÃO;

COMANDO 1;

COMANDO 2;

EFETIVA OU REVERTE A TRANSAÇÃO;
```

### Comandos

💡 (Referência - START TRANSACTION, COMMIT, and ROLLBACK Statements)[<https://dev.mysql.com/doc/refman/8.0/en/commit.html>]

O MySQL trata em seus [padrões](<https://dev.mysql.com/doc/refman/8.0/en/compatibility.html>), os seguintes comandos para lidar com o controle de uma transação

```sql
START TRANSACTION or BEGIN inicia uma nova transação.

COMMIT efetiva as mudanças da transação atual, fazendo com que elas sejam permanentes na base de dados.

ROLLBACK reverte as mudanças da transação atual, cancelando as mesmas.

```

Ainda há o parâmetro do banco de dados que controla a efetivação automática, chamado `autocommit`.
Por padrão, seu valor é 1, ou seja, todo e qualquer comando isolado, caso executado com sucesso, *é efetivado automaticamente*.

---
Desligando o _autocommit_

```sql
SET autocommit = 0;
```

Ligando o _autocommit_

```sql
SET autocommit = 1;
```

---

### Exemplo - COMMIT

```sql
BEGIN;

INSERT INTO usuario (user_name, email)
     VALUES ('maria', 'maria.etec@etec.sp.gov.br');

INSERT INTO endereco (endereco, cidade, cep, usuario_id)
     VALUES ('Avenida São Paulo, S/N', 'São Roque', '13810-220', LAST_INSERT_ID());

COMMIT;
```

### Exemplo - ROLLBACK

```sql
BEGIN;

INSERT INTO usuario (user_name, email)
     VALUES ('carlos', 'carlos.fonseca@etec.sp.gov.br');

INSERT INTO endereco (endereco, cidade, cep, usuario_id)
     VALUES ('Rua Treze de Abril, 122', 'Santos', '11070-000', LAST_INSERT_ID());

ROLLBACK;
```

### Exemplo do vídeo

```sql
#Cópias disponíveis
SELECT i.inventory_id
     , f.film_id
     , f.title
  FROM inventory i
  JOIN store s USING (store_id)
  JOIN film f  USING (film_id)
 WHERE s.store_id = 1
   AND f.title LIKE 'G%'
   AND NOT EXISTS (SELECT r.rental_id 
                     FROM rental r
                    WHERE r.inventory_id = i.inventory_id
                      AND r.return_date IS NULL)
 LIMIT 15, 20;

#FAZENDO UMA TRANSAÇÃO
SELECT @@autocommit;

SET AUTOCOMMIT = 0;

BEGIN;

INSERT INTO rental (inventory_id, customer_id, staff_id)
     VALUES (1598, 1, 1);

UPDATE rental r 
    SET r.return_date = DATE_ADD(r.rental_date
                                ,  INTERVAL
                                        (SELECT rental_duration
                                           FROM film f
                                          WHERE f.film_id = 1)
                                   DAY)
WHERE r.rental_id = LAST_INSERT_ID();

#ROLLBACK;
COMMIT;

SET AUTOCOMMIT = 1;
```
