# Exercícios: Revisão - Conteúdo BD2

## Boas práticas para os exercícios

Este conjunto de exercícios deve ser persistido em um repositório privado seu, no GitHub, com o nome ```bd3-semana01```.
Para cada exercício abaixo crie um novo arquivo .sql, legível e com boa identação do código SQL, no formato ```S01E01-<nomeDoExercicio>.sql```

Por exemplo, se o exercício disser:

```[videos]``` Defina a instrução que ...

Você criará um arquivo com o nome:

```
S01E01-videos.sql
```

no repositório

```
bd3-semana01
```

Link de exemplo: (<https://github.com/exercicios-aulas-bd3/bd3-semana01/blob/master/S01E01-videos.sql>)

No Teams, deverá ser informado o link do repositório apenas, para o caso acima, deveria ser fornecido o link (<https://github.com/exercicios-aulas-bd3/bd3-semana01/>)

Casos específicos serão tratados em aulas futuras.

---

## Modelo de dados - Sakila

Referência: (<https://dev.mysql.com/doc/sakila/en/sakila-introduction.html>)
O Sakila DB é um modelo de banco de dados utilizado para fins educacionais, produzido internamente pelo time de desenvolvimento do MySQL.

Ele já é instalado por padrão no MySQL, caso você o instale de forma completa. Caso não o tenha, siga a sua instalação por [aqui](https://dev.mysql.com/doc/sakila/en/sakila-installation.html)

![The Sakila Schema - © 2020, Oracle Corporation and/or its affiliates](https://dev.mysql.com/doc/sakila/en/images/sakila-schema.png)

---

## Tabelas

Referência: (<https://dev.mysql.com/doc/sakila/en/sakila-structure-tables.html>)

Cada tabela é descrita no link acima, com suas informações e campos. A descrição está em inglês.

## Exercícios

---

`1. [ator_nomeCompleto]` Exiba o primeiro e o último nome dos atores no formato "Sobrenome, Nome".

---
`2. [ator_nomeCompletoUpper]` Exiba o primeiro e o último nome dos atores no formato "NOME SOBRENOME", em caixa alta. O nome da coluna deverá ser `Nome do Ator`

---
`3. [ator_primeiroNome_Joe]` Busque o ID, primeiro e último nome de um ator, cujo primeiro nome é `Joe`.

---
`4. [ator_nome_gen]` Exiba todos os atores cujo último nome contenham `GEN`.

---
`5. [ator_nome_li_ordenado]` Exiba todos os atores cujo último nome contenham `LI`. Ordene o resultado pelo último nome, de forma ascendente e pelo último nome, de forma descendente.

---
`6. [pais_especificos_in]` Utilizando a cláusula `IN`, exiba os campos `country_id` e `country` dos seguintes países: Brazil, Chile, Moldova e Saudi Arabia.

---
`7. [ator_nome_do_meio]` Adicione a coluna `middle_name` (nome do meio) para a tabela de atores. Estruturalmente, ela deve estar localizada entre as colunas `first_name` e `last_name`. Fica ao seu critério definir o tipo de dados da nova coluna.

---
`8. [ator_nome_do_meio_o_retorno]` Nomes do meio costumam ser grandes, os atores exageram muito! Altere o tipo de dados da coluna `middle_name` para o tipo `blob`.

---
`9. [ator_nome_do_meio_o_fim]` Remova a coluna `middle_name` da tabela de atores.

---
`10. [ator_quanto_sobrenome]` Liste todos os sobrenomes dos atores e a quantidade de atores que tenha determinado sobrenome.

---
`11. [ator_quantidade_unica]` Escreva uma query que determine a quantidade de sobrenomes distintos na tabela de atores.

---
`12. [ator_quantidade_aparicoes]` Qual o ator que apareceu em mais filmes? Escreva uma query que demonstre a quantidade de aparições dos atores dos filmes em ordem decrescente, pela quantidade. Não exiba os atores que tiveram zero aparições.

---
`13. [filme_disponibilidade_loja]` O filme `ARMAGEDDON LOST` está disponível para locação na loja 1? Escreva uma query que demonstre isso.

---
`14. [aluguel_filme]` Crie uma query que insira um novo registro que indique a locação do filme `ARMAGEDDON LOST`, do vendedor `Mike Hillyer` na loja 1 com a data atual do sistema.

---
`15. [aluguel_filme_vencimento]` Crie uma query que exiba a data de devolução do aluguel do exercício anterior.

---
`16. [filme_media_reproducao]` Qual a média de tempo de exibição dos filmes que estão catalogados no Sakila DB? Escreva uma query que mostre isso.

---
`17. [filme_media_reproducao_categoria]` Qual a média de tempo de exibição dos filmes que estão catalogados no Sakila DB, agrupados por categoria? Escreva uma query que mostre isso.

---
`18. [filme_media_reproducao_categoria]` Qual a média de tempo de exibição dos filmes que estão catalogados no Sakila DB, agrupados por categoria? Escreva uma query que mostre isso.

---
`19. [vendas_por_funcionario_mensal]` Escreva uma query que demonstre o total de vendas para cada um dos funcionários em Agosto de 2005. Utilize as tabelas `staff` e `payment`. 

---
`20. [vendas_por_cliente_ordenado]` Escreva uma query que liste o total pago por cada cliente, em ordem alfabética. Utilize as tabelas `customer` e `payment`.

---
`21. [vendas_por_loja]` Escreva uma query que mostre o total faturado por loja, em dólarespago por cada cliente, em ordem alfabética. Utilize as tabelas `store`, `staff` e `payment`.

---
`22. [categoria_familia]` Queremos fazer uma campanha para as famílias. Escreva uma query que identifique todos os filmes categorizados como familiares.

---
`23. [filmes_mais_alugados]` Escreva uma query que demonstre os filmes mais alugados em ordem decrescente da frequência.

---
