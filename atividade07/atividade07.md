# Atividade 07

Data de Entrega: 08/10/2022
Valor: 2,0 pontos na segunda nota.

Crie uma pasta chamada atividades/atividade07 e coloque os arquivos da atividade nela.

##### Questão 01 - 2,0 Pontos
Escreva um _script_ chamado `alertaDiretorio.sh` que recebe como parâmetros um valor inteiro que serve como intervalo de tempo em segundos e um nome que indica o caminho de um diretório.
A cada intervalo, a quantidade de arquivos em um diretório será analisada. Caso a quantidade de arquivos se altere entre duas verificações, o _script_ deve atualizar um arquivo chamado `dirSensors.log` com as seguintes informações:

1. A data que a alteração foi percebida.
2. Quantos arquivos existiam.
3. Quantos existem agora.
4. Quais foram alterados, adicionados ou removidos.


Na mesma pasta da atividade, crie um diretório chamado _diretorioMonitorado_ para testar.
Para ajudar a testar, você pode deixar seu _script_ executando em uma sessão _screen_ ou _tmux_, monitorando o diretório a cada 5 segundos. Exemplo de execução:

```sh
$ ./alertaDiretorio.sh 5 diretorioMonitorado
[25-01-2021 12:59:51] Alteração! 3->2. Removidos: notas.txt
[25-01-2021 13:04:51] Alteração! 2->4. Adicionados: a.txt, b.txt
[25-01-2021 13:09:51] Alteração! 4->3. Removidos: a.txt
[25-01-2021 13:14:51] Alteração! 3->2. Removidos: b.txt  
```