# Atividade 06

Data de Entrega: 01/10/2022
Valor: 3,0 pontos na Primeira nota.

Crie uma pasta chamada atividades/atividade06 e coloque os arquivos da atividade nela.

##### Questão 01 - 1,5 Pontos
Você vai desenvolver o _script_ `latencia.sh`. Esse _script_ vai receber como parâmetro o nome de um arquivo de texto, contendo um endereço IP por linha.
O _script_ deve usar o comando _ping_ para enviar dez pacotes ICMP para cada endereço do arquivo, calculando o valor médio do tempo de resposta. Ao final, deve imprimir uma lista de IP ordenada do menor para o maior tempo médio de resposta, informando além do endereço, o tempo de resposta médio.
Abaixo um exemplo da execução:

```sh
#os IPs abaixo são fantasia. 
$ cat enderecos_ip.txt
8.8.8.8
192.168.0.1
54.230.57.207
$ ./latencia.sh enderecos_ip.txt
192.168.0.1 11.1ms
54.230.57.207 55.4ms
8.8.8.8 94.0ms
```

##### Questão 02 - 1,5 Pontos
Nesta questão, o nome do _script_ será `cinco_diretorios.sh`. Ao ser executado, o _script_ deve realizar as seguintes tarefas:

1. Criar um diretório chamado cinco.
2. Criar cinco subdiretórios cinco/dir1 até cinco/dir5.
3. Em cada subdiretório, faça quatro arquivos, `arq1.txt` até `arq4.txt`. O arquivo `arq1.txt` deve ter uma linha contendo apenas o dígito 1. O arquivo `arq2.txt` deve ter duas linhas, cada uma contendo o dígito 2. O arquivo `arq3.txt` deve ter três linhas, cada uma contendo o dígito 3. E por fim, O arquivo `arq4.txt` deve ter quatro linhas, cada uma contendo o dígito 4.


Você não pode repetir chamadas ao _mkdir_ 6 vezes e executar 20 comandos para criar os 20 arquivos. Você deve obrigatoriamente utilizar laços aninhados para criar a estrutura.
Não carregue a estrutura de diretórios no repositório, apenas o _script_.
