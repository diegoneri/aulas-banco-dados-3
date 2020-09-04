# Procedimentos armazenados em bloco

* [📽 Veja esta vídeo-aula no Youtube](_EM BREVE_)
* [📚 Referência oficial - _Stored Objects_](https://dev.mysql.com/doc/refman/8.0/en/stored-objects.html "Documentação oficial - Stored Objects")
* [📚 Referência oficial - _Stored Routines_](https://dev.mysql.com/doc/refman/8.0/en/stored-routines.html "Documentação oficial - Stored Routines")
* [⁉ FAQ - _Frequently Asked Questions_](https://dev.mysql.com/doc/refman/8.0/en/faqs-stored-procs.html "Perguntas gerais")

Índice

* [Introdução](#Introdução "Introdução")
* [Vantagens](#Vantagens "Vantagens do uso de Rotinas")
* [Desvantagens](#Desvantagens "Desvantagens do uso de Rotinas")
* [MySQL - Stored Procedures e Stored Functions](#MySQL---Stored-Procedures-e-Stored-Functions "MySQL - Stored Procedures e Stored Functions")
* [Contexto transacional](#Contexto-transacional "Contexto transacional")
* [Bloco de comandos - implementando transações](#Bloco-de-comandos---implementando-transações "Bloco de comandos - implementando transações")

## Introdução

Quando falamos em [comandos em blocos](../transacoes.md "Transações"), pertencentes a uma **transação**, não podemos nos limitas a execução de um ou dois comandos.
Dado isto, podemos imaginar o cenário em que temos procedimentos complexos ou *rotinas*, que envolvam além de um _INSERT_ ou _UPDATE_, para não nos limitarmos aos blocos anônimos. Eles não vão resolver alguns problemas comuns de um conjunto de instruções estruturadas:

* Controle de exceções;
* Desvios condicionais;
* Iteração;
* Variáveis, parâmetros e retornos;
* Outros.

Para isso, temos em bancos de dados relacionais, o uso de _Procedures_ e _Functions_ (você também pode encontrar materiais falando sobre _Stored Procedures_ e _Stored Functions_), que nos facilitam o uso de um conjunto de instruções simples e complexas no banco de dados, sem depender da implementação do _backend_.

Todas estas instruções podem ser armazenadas no banco de dados, em forma de rotina, de forma que o cliente / _backend_ não necessite enviar comandos individuais e assim, se referir a determinada rotina.

## Quando usar

1. Quando várias aplicações clientes são escritas em diferentes linguagens ou funcionam em diferentes plataformas, mas precisam realizar as mesmas operações de banco de dados.
1. Quando a segurança é prioritária. Bancos, por exemplo, usam stored procedures para todas as operações comuns. Isto fornece um ambiente consistente e seguro, e procedures podem assegurar que cada operação seja registrada de forma apropriada. Neste tipo de configuração, aplicações e usuários não conseguiriam nenhuma acesso as tabelas do banco de dados diretamente, mas apenas podem executar stored procedures específicas.

## Vantagens

* Redução de tráfego de rede;
* Centralização de lógica no banco de dados;
* Aumenta a segurança das operações com o banco de dados.
  * Neste caso, os consumidores podem ter acesso somente as rotinas ao invés do acesso às tabelas.

## Desvantagens

* Uso de recursos de forma excessiva do banco de dados;
* _Troubleshooting_;
* Centralização de lógica no banco de dados;
* Manutenção do código e impactos em consumidores.

## MySQL - Stored Procedures e Stored Functions

Para procedimentos armazenados, o MySQL segue a especificação SQL:2003 para rotinas, que também é utlizada pelo DB2 da IBM.
Podem haver limitações, elas podem ser encontradas na documentação oficial.

Leia mais em:

* [Stored Procedures](stored-procedures.md)
* Stored Functions(_EM BREVE_)
