# MySQL - Delimitadores

* [📚 Referência oficial](https://dev.mysql.com/doc/refman/8.0/en/mysql-commands.html "Documentação oficial")
* [📚 Uso de delmitadores e procedimentos armazenados](https://dev.mysql.com/doc/refman/8.0/en/stored-programs-defining.html "Uso de delmitadores e procedimentos armazenados")

Índice

* [Introdução](#Introdução "Introdução")
* [Sintaxe](#Sintaxe "Sintaxe")
* [Utilizando o DELIMITER para procedimentos armazenados](#Utilizando-o-DELIMITER-para-procedimentos-armazenados "DELIMITER e Procedimentos Armazenados")
* [Resumo](#Resumo "Resumo")

## Introdução

Ao escrever instruções SQL, você usa o ponto e vírgula (;) para separar duas instruções como o exemplo a seguir:

```sql
SELECT * FROM actor;

SELECT * FROM film;
```

Uma IDE para MySQL como o MySQL Workbench ou no uso via CLI, utilizamos o  delimitador (;) para separar instruções e executá-las individualmente.

Um procedimento armazenado, entretanto, possui diversas instruções separadas por um ponto-e-vírgula (;).

Portanto, você deve redefinir o delimitador temporariamente para que possa passar todo o procedimento armazenado para o servidor como uma única instrução.

## Sintaxe

Para alterar o delimitador padrão, você usa o comando `DELIMITER`:

```sql
DELIMITER string_delmitacao
```

A `string_delmitacao` pode consistir em um único caractere ou vários caracteres, por exemplo, // ou $$. No entanto, você deve evitar usar a barra invertida (\) porque este é o caractere de escape no MySQL.

Abaixo temos um exemplo para alterar o delimitador para `$$`:

```sql
DELIMITER $$
```

Uma vez alterado, pode-se utilizar o delimitador conforme abaixo:

```sql
DELIMITER $$

SELECT * FROM actor $$

SELECT * FROM film $$
```

## Utilizando o DELIMITER para procedimentos armazenados

Um procedimento armazenado normalmente contém múltiplas instruções separadas por ponto-e-vírgula (;).
Para a compilação de todo o procedimento armazenado como uma instrução única, você __deve__ alterar temporariamente o delimitador do caracter ponto-e-vírgula (;) para outro qualquer. Neste curso, vamos utilizar $$:

```sql
DELIMITER $$

CREATE PROCEDURE nome_procedure()
BEGIN
  -- statements
END $$

DELIMITER ;
```

## Resumo

1. Altere o caracter de delimitação para $$
1. Use o (;) para todas as instruções no corpo do procedimento armazenado e $$ após a palavra-chave `END`.
1. Altere o caracter de delimitação de volta para ;