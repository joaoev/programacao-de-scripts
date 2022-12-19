# Atividade 05

Data de Entrega: 24/09/2022
Valor: 2,0 pontos na Primeira nota.

Crie uma pasta chamada atividades/atividade05 e coloque os arquivos da atividade nela.

##### Questão 01 - 0,5 Pontos

Faça um script chamado `maiorDe3Verificado.sh` que receba três números como parâmetros e retorne o maior. Não pode utilizar o comando sort. Esse script tem que reclamar caso um dos parâmetros não seja número. Por exemplo:
```
$ ./maiorDe3Verificado.sh 4 6 5
6
$ ./maiorDe3Verificado.sh casa 10 11
Opa!!! casa não é número.
```
##### Questão 02 - 1,5 Pontos

Nesta questão, você deve desenvolver uma agenda em um _script_ chamado `agenda.sh` que gerencie nomes e _e-mails_ em um arquivo de texto. Esse arquivo de texto deve ser chamado `agenda.db` e tem o seguinte formato:
```
Professor Um:professorum@outlook.com
Professor Dois:professordois@ufc.br
Professor Três:professortres@gmail.com
Professor Quatro:professorquatro@gmail.com
```
O _script_ `agenda.sh` deve suportar três operações: adicionar, remover, listar. A operação, os nomes e _e-mails_ devem ser passados por parâmetros. Além disso, o _script_ deve avisar quando o arquivo `agenda.db` for criado pela primeira vez. Abaixo, um exemplo da execução:
```
$ ./agenda.sh listar
Arquivo vazio!!!
$ ./agenda.sh adicionar "Professor Um" "professorum@outlook.com"
Arquivo criado!!!
Usuário Professor Um adicionado.
$ ./agenda.sh adicionar "Professor Dois" "professordois@ufc.br"
Usuário Professor Dois adicionado.
$ ./agenda.sh adicionar "Professor Quatro" "professorquatro@gmail.com"
Usuário Professor Quatro adicionado.
# ./agenda.sh listar
Professor Um:professorum@outlook.com
Professor Dois:professordois@ufc.br
Professor Quatro:professorquatro@gmail.com
# ./agenda.sh remover professorum@outlook.com
Usuário Professor Um removido.
# ./agenda.sh listar
Professor Dois:professordois@ufc.br
Professor Quatro:professorquatro@gmail.com 
```
Em outras palavras:
1. **Adicionar**: parâmetro _adicionar_ e mais dois parâmetros, nome e _e-mail_.
2. **Listar**: apenas o parâmetro _listar_.
3. **Remover**: parâmetro _remover_ e mais um parâmetro, o _e-mail_. No caso da remoção de um usuário que não existe, o _script_ deve apenas avisar o fato e não alterar o arquivo.


Não precisa se preocupar em ordenar o arquivo `agenda.db`, a não que isso facilite sua tarefa.