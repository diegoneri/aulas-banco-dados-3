# Administração de Banco de Dados - Backup e Restauração

* 📽 Veja esta vídeo-aula no Youtube (_EM BREVE_)

## O backup de um banco de dados

É primorial que, o seu banco de dados, pessoal ou corporativo, tenha cópias fidedignas em um local seguro, afim de se prevenir contra desastres em seu SGBD. Para isso, devemos executar rotinas de backup no SGBD, a partir de políticas estabelecidas por uma corporação.

Comumente, os backups de um banco de dados são diários, ou seja, a cada dia, normalmente em um horário **fora** da operação, geralmente, de madrugada, há uma rotina automática que executa o backup de um SGBD.

A automação não faz parte do escopo deste curso, porém, imaginem que isto é feito com a associação da execução de um script no shell de comandos, que é agendado por uma aplicação ou pelo próprio Sistema Operacional em que o SGBD está instalado.

O link <https://www.jotform.com/blog/how-to-backup-mysql-database/> mostra as diversas possibilidades de backup no MySQL. Aqui veremos como fazer o backup via MySQLDUMP.

## Backup no MySQL - MySQLDump

O mysqldump é um utilitário de execução via shell que nos auxilia a fazer o backup do banco de dados para um arquivo externo ou até mesmo para outro banco de dados MySQL.

Porém, _backup_ não seria o termo adequado para se determinar a tarefa do MySQL dump; ele cria um conjunto de  comandos "CREATE TABLE" e "INSERT INTO" que podem ser executados em um servidor MySQL para recriar sua base de dados.

Este utilitário pode ser encontrado na pasta MySQL Server xx\bin no Windows (c:\Program Files\MySQL\MySQL Server 8.0\bin\mysqldump.exe, por exemplo) e na pasta /usr/local/mysql/bin em SOs Unix/Linux aonde o MySQL está instalado.

O mysqldump aceita uma série de argumentos, que podem mudar a sua forma de realizar a tarefa de backup.

Na forma básica, pode-se executar o utilitário desta forma:

```sql
mysqldump ---user [usuário] ---password=[senha]  

[database name] > [dump file]

```

* user [usuário]: O parâmetro ---user seguido de um usuário **válido** no seu servidor MySQL indica qual o usuário que fará a tarefa do dump do banco de dados. Para isso, a conta deve ter as devidas permissões para tal - falaremos disto no próximo tópico do curso.
* password=[senha]: A senha para o usuário, mencionado no parâmetro supracitado.
* [database name]: O nome do banco de dados que o mysqldump fará o backup. Caso queira fazer um backup completo, utilize _–databases_ ou _–all-databases_ para incluir todos os bancos de dados da sua instância.
* > [dump file]: Em arquivos de lote (_batch files_), o símbolo ">" define que você está **redirecionando** a saída da execução a um stream de dados ou um arquivo. No mysqldump, utilizamos o ">" para preceder o nome do arquivo aonde vamos realizar o backup. Se não for especificado, será criado um arquivo no diretório da execução do mysqldump.

