# MySQL - _Triggers_

* 📽 Veja esta vídeo-aula no Youtube (_EM BREVE_)
* [📚 Referência oficial](https://dev.mysql.com/doc/refman/8.0/en/triggers.html "Documentação oficial - Using Triggers")
* [⁉ FAQ - _Frequently Asked Questions_](https://dev.mysql.com/doc/refman/8.0/en/faqs-triggers.html "Perguntas gerais")

Índice
* [Conceito](#Conceito "Conceito")

* [Sintaxe básica](#Sintaxe-básica "Sintaxe básica")
  * [Sintaxe de criação](#Sintaxe-de-criação "Sintaxe de criação")
  * [Sintaxe de criação](#Sintaxe-de-criação "Sintaxe de criação")
    * [(NOT) DETERMINISTIC](#(NOT)-DETERMINISTIC "(NOT) DETERMINISTIC")
    * [Parâmetro log_bin_trust_function_creators](#Parâmetro-log_bin_trust_function_creators "Parâmetro log_bin_trust_function_creators")
  * [Sintaxe de execução](#Sintaxe-de-execução "Sintaxe de execução")
* [Exemplo](#Exemplo "Exemplo")
  * [Exemplo de criação](#Exemplo-de-criação "Exemplo de criação")
  * [Exemplos de execução](#Exemplos-de-execução "Exemplos de execução")

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

* _INSERT_: o operador NEW.nome_coluna, nos
permite verificar o valor enviado para ser inserido
em uma coluna de uma tabela.
OLD.nome_coluna não está disponível.
* _DELETE_: o operador OLD.nome_coluna nos
permite verificar o valor excluído ou a ser
excluído. NEW.nome_coluna não está disponível.
* _UPDATE_: tanto OLD.nome_coluna quanto
NEW.nome_coluna estão disponíveis, antes
(BEFORE) ou depois (AFTER) da atualização de
uma linha.

## Sintaxe básica

<https://dev.mysql.com/doc/refman/8.0/en/stored-routines-syntax.html>
<https://dev.mysql.com/doc/refman/8.0/en/create-procedure.html>

### Sintaxe de criação

```sql
DELIMITER $$

DROP FUNCTION IF EXISTS nome_function;

CREATE FUNCTION nome_procedure(<parametros, ...>) RETURNS <TIPO_RETORNO>
[<(NOT) DETERMINISTIC>]
BEGIN
   /*comandos;*/
   RETURN <TIPO_RETORNO>;
END;
$$

DELIMITER ;
```

#### (NOT) DETERMINISTIC

<https://dev.mysql.com/doc/refman/8.0/en/stored-programs-logging.html>

Este parâmetro é uma declaração para determinar se a function altera ou não dados, para fins de organização da base de dados em rotinas administrativas.

* `NOT DETERMINISTIC` --> são funções que alteram os dados de alguma forma, através de um update, insert ou delete. Esta declaração ajuda o banco de dados a entender se a _FUNCTION_ pode não ser segura para fins de _recovery_ ou replicação de uma base de dados.

* `DETERMINISTIC` --> são funções que **não** alteram os dados. Elas são ditas que são seguras para replicação ou recuperação de uma base de dados.

##### Parâmetro log_bin_trust_function_creators

O parâmetro log_bin_trust_function_creators faz com que o banco de dados confie nos usuários criadores de _Functions_, que eles vão adotar corretamente o parâmetro __DETERMINISTIC__ na criação do objeto.

Uma vez que o MySQL *não* verifica o conteúdo de uma _Function_, para saber se é _deterministic_ ou _not deterministic_, ele vai deixar a cargo do desenvolvedor a informação opcional do parâmetro.

* 0 --> DETERMINISTIC é obrigatório
* 1 --> DETERMINISTIC é opcional

Para nossos estudos, tornaremos o DETERMINISTIC como opcional:

```sql
SET GLOBAL log_bin_trust_function_creators = 1;
```

### Sintaxe de execução

```sql
SELECT nome_function(<parametros, ...>)
```

Obs: a execução também pode ser feita em outros locais, como por exemmplo, dentro de uma outra FUNCTION ou PROCEDURE.

## Exemplo

### Exemplo de criação

```sql
DELIMITER $$

DROP FUNCTION IF EXISTS hello_world$$

CREATE FUNCTION hello_world(p_info VARCHAR(40))
RETURNS VARCHAR(50)
BEGIN
   RETURN CONCAT('Hello ', p_info);
END;
$$

DELIMITER ;
```

![Criação de Function](image/012.gif)

Outro exemplo:

```sql
DELIMITER $$

DROP FUNCTION IF EXISTS hello_world_lang$$

CREATE FUNCTION hello_world_lang(p_info VARCHAR(40), p_lang CHAR(3))
RETURNS VARCHAR(50)
BEGIN
   IF (p_lang = 'BRA') THEN
      RETURN CONCAT('Olá ', p_info);
   ELSE
      RETURN CONCAT('Hello ', p_info);
   END IF;
END;
$$

DELIMITER ;
```

![Criação de Function](image/013.gif)

### Exemplos de execução

```sql
SELECT hello_world('Diego')
     , hello_world_lang('Neri', 'BRA');
```

![Execução de Functions](image/014.gif)
