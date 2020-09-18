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

* _INSERT_: o operador NEW.nome_coluna, nos permite verificar o valor enviado para ser inserido em uma coluna de uma tabela. OLD.nome_coluna não está disponível.
* _DELETE_: o operador OLD.nome_coluna nos permite verificar o valor excluído ou a ser excluído. NEW.nome_coluna não está disponível.
* _UPDATE_: tanto OLD.nome_coluna quanto NEW.nome_coluna estão disponíveis, antes (BEFORE) ou depois (AFTER) da atualização de uma linha.

## Sintaxe básica


### Sintaxe de criação



![Criação de Function](image/013.gif)

### Exemplos de execução

```sql
SELECT hello_world('Diego')
     , hello_world_lang('Neri', 'BRA');
```

![Execução de Functions](image/014.gif)
