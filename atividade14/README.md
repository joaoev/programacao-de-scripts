# Atividade 14

Data de Entrega: 10/12/2022
Valor: 5 pontos na terceira nota.

##### Questão 01 - 2,5 Pontos
O nome do _script_ principal desta atividade é `criarDuasInstancias.sh`.
Nesta questão, você deve começar criando um grupo de segurança com as seguintes características:

1. Aceitar conexões SSH (22/tcp) **apenas** a partir do IP visível da máquina que está executando o script.
2. Aceitar conexões HTTP (80/tcp) a partir da Internet.
3. Aceitar conexões MySQL (3306/tcp) a partir de outras máquinas no mesmo grupo de segurança.

Com o grupo de segurança criado, o _script_ deve criar uma primeira máquina virtual e realizar as seguintes ações:

1. Instalar o servidor MySQL.
2. Habilitar o acesso por todas as interfaces de rede da máquina.
3. Criar um banco de dados chamado _scripts_, usando usuário e senha para acesso remoto.

Em seguida, informar na tela o IP Privado. Essa informação também é usada na próxima etapa.
O _script_ deve partir então para criar uma segunda instância. As seguintes ações devem ser realizadas na criação desse novo servidor:

1. Os pacotes cliente do MySQL deve ser instalados.
2. Uma conexão deve ser feita no servidor da primeira máquina.
3. No banco _scripts_, criar uma tabela chamada Teste com apenas um campo chamado atividade do tipo inteiro.

A correção será feita pelo _login_ do professor na segunda máquina, em seguida de conexão manual ao banco e verificação se a tabela foi de fato criada.
Abaixo, um exemplo da invocação e saídas produzidas.

```
$ ./criarDuasInstancias.sh nomedachave usuario senha
Criando servidor de Banco de Dados...
IP Privado do Banco de Dados: 172.31.64.108

Criando servidor de Aplicação...
IP Público do Servidor de Aplicação: 100.25.42.191
```

##### Questão 02 - 2,5 Pontos
O nome do _script_ principal desta atividade é `wordpress.sh`.
O objetivo é criar um _script_ que faça uma instalação do _WordPress_ com o banco de dados e o servidor _web_ executando em instâncias diferentes.
Como na atividade anterior, você deve começar criando um grupo de segurança com as seguintes características:

1. Aceitar conexões SSH (22/tcp) **apenas** a partir do IP visível da máquina que está executando o script.
2. Aceitar conexões HTTP (80/tcp) a partir da Internet.
3. Aceitar conexões MySQL (3306/tcp) a partir de outras máquinas no mesmo grupo de segurança.

A primeira parte é idêntica, o _script_ deve criar uma primeira máquina virtual e realizar as seguintes ações:

1. Instalar o servidor MySQL.
2. Habilitar o acesso por todas as interfaces de rede da máquina.
3. Criar um banco de dados chamado _scripts_, usando usuário e senha para acesso remoto.

Em seguida, informar na tela o IP Privado. Essa informação também é usada na próxima etapa.
O _script_ deve partir então para criar uma segunda instância. Agora há uma diferença. As seguintes ações devem ser realizadas na criação desse novo servidor:

1. Os pacotes cliente do MySQL deve ser instalados.
2. Uma pilha LAMP (_Linux Apache MySQL PHP_) deve ser configurada.
3. O código do _WordPress_ deve ser baixado e descompactado. Um arquivo de configuração com as informações do banco da primeira instância deve ser criado.
4. O _WordPress_ deve ser instalado no _Apache_.

Você pode usar o _nginx_ se assim desejar.
Abaixo, um exemplo da invocação e saídas produzidas.

```
$ ./wordpress.sh nomedachave usuario senha
Criando servidor de Banco de Dados...
IP Privado do Banco de Dados: 172.31.64.108

Criando servidor de Aplicação...
IP Público do Servidor de Aplicação: 100.25.42.191      

Acesse http://100.25.42.191/wordpress para finalizar a configuração.
```

ATENÇÃO: A configuração que deve restar a ser feita só pode envolver a criação do usuário para o _WordPress_ e a definição do nome do site. Informações do Banco de Dados não devem ser requisitadas, pois precisam ser configuradas no arquivo de configuração do _WordPress_.
