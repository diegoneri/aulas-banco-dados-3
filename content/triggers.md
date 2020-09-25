# MySQL - _Triggers_

* 📽 Veja esta vídeo-aula no Youtube (_EM BREVE_)
* [📚 Referência oficial](https://dev.mysql.com/doc/refman/8.0/en/triggers.html "Documentação oficial - Using Triggers")
* [⁉ FAQ - _Frequently Asked Questions_](https://dev.mysql.com/doc/refman/8.0/en/faqs-triggers.html "Perguntas gerais")

Índice

* [Conceito](#Conceito "Conceito")
* [Valores _NEW_ e _OLD_](#Valores-_NEW_-e-_OLD_ "Valores _NEW_ e _OLD_")
* [Sintaxe](#Sintaxe "Sintaxe")
* [Exemplos](#Exemplos "Exemplos")

## Conceito

Cada comando de manipulação DML (INSERT, DELETE, UPDATE) gera um **evento** para a tabela a qual o comando é direcionado.

Para este evento, é possível a associação de um objeto de banco de dados, chamado _Trigger_ (Gatilho), que pode ser utilizado, por exemplo, para validar valores a serem criados em um INSERT ou mesmo atualizar valores após um INSERT ou UPDATE, por exemplo.

Estes eventos são chamados de _trigger events_. São eles:

* BEFORE INSERT
* BEFORE UPDATE
* BEFORE DELETE
* AFTER INSERT
* AFTER UPDATE
* AFTER DELETE

Ou seja:

* BEFORE --> ANTES (INSERT, DELETE, UPDATE)
* AFTER --> APÓS (INSERT, DELETE, UPDATE)

Triggers não são ativados por ações de chaves-estrangeiras (ON UPDATE CASCADE, ON DELETE CASCADE).

## Valores _NEW_ e _OLD_

* _INSERT_: o operador NEW.nome_coluna, nos permite verificar o valor enviado para ser inserido em uma coluna de uma tabela. OLD.nome_coluna não está disponível.
* _DELETE_: o operador OLD.nome_coluna nos permite verificar o valor excluído ou a ser excluído. NEW.nome_coluna não está disponível.
* _UPDATE_: tanto OLD.nome_coluna quanto NEW.nome_coluna estão disponíveis, antes (BEFORE) ou depois (AFTER) da atualização de uma linha.

## Sintaxe

```sql
DELIMITER $$
DROP TRIGGER IF EXISTS NOME_TRIGGER$$
CREATE TRIGGER NOME_TRIGGER [BEFORE|AFTER] [INSERT|DELETE|UPDATE] ON TABELA
FOR EACH ROW
BEGIN
  #PROCEDIMENTOS
END;
$$
```

## Exemplos

### Ao criar uma conta, normalizar saldos

```sql
DELIMITER $$
DROP TRIGGER IF EXISTS t_nova_conta$$
CREATE TRIGGER t_nova_conta BEFORE INSERT ON conta
FOR EACH ROW
BEGIN
   IF (NEW.saldo < 0) THEN
      SET NEW.saldo = 0;
   END IF;
END;
$$
```

### Ao criar uma conta, registrar abertura

```sql
DELIMITER $$
DROP TRIGGER IF EXISTS t_registra_nova_conta$$
CREATE TRIGGER t_registra_nova_conta AFTER INSERT ON conta
FOR EACH ROW
BEGIN
   INSERT INTO movimentacao VALUES
      (NEW.numero_conta, NOW(), NEW.saldo, CONCAT('Conta ', NEW.numero_conta, ' aberta com ', NEW.saldo));
END;
$$
```

### Ao atualizar uma conta, registrar alteração

```sql
DELIMITER $$
DROP TRIGGER IF EXISTS t_altera_conta$$
CREATE TRIGGER t_altera_conta AFTER UPDATE ON conta
FOR EACH ROW
BEGIN
   INSERT INTO movimentacao VALUES
      (NEW.numero_conta
      , NOW()
      , NEW.saldo
      , CONCAT('Alteração manual de dados em '
               , NEW.numero_conta
               , '. Saldo anterior: '
               , OLD.saldo
               , '. Saldo atual: '
               , NEW.saldo
               )
      );
END;
$$
```
