# Atividade 09

Data de Entrega: 22/10/2022
Valor: 1,0 ponto na segunda nota.

Crie uma pasta chamada atividades/atividade09 e coloque os arquivos da atividade nela.

##### Questão 01 - 1,0 Ponto
Vamos criar um _script_ chamado `hosts.sh` que nos ajude a relacionar nomes de máquinas à IPs.
1. O _script_ deve guardar em um arquivo chamado `hosts.db` um par (nomedamaquina,IP) para cada entrada.
2. Você deve criar as seguintes funções para manipular o arquivo que são invocadas com os parâmetros indicados:
    * adicionar (parâmetros -a hostname -i IP)
    * remover (parâmetro -d hostname)
    * procurar (parâmetro hostname)
    * listar (parâmetro -l)

Você precisa obrigatoriamente utilizar o comando _getopts_ para tratar os parâmetros de entrada. As funções vão ser simples mesmo, o objetivo é apenas praticar a sintaxe.
Exemplo de execução do _script_:
```sh
 $ ./hosts.sh -a routerlab -i 192.168.0.1
 $ ./hosts.sh -a lab01 -i 192.168.0.100
 $ ./hosts.sh -a lab02 -i 192.168.0.101
 $ ./hosts.sh -l
 routerlab 192.168.0.1
 lab01     192.168.0.100
 lab02     192.168.0.101
 lab03     192.168.0.102
 $ ./hosts.sh -d routerlab
 $ ./hosts.sh -d lab01
 $ ./hosts.sh -l
 lab02     192.168.0.101
 lab03     192.168.0.102
 $ ./hosts.sh lab02
 192.168.0.101
 $ ./hosts.sh -r 192.168.0.101
 lab02
 ```
