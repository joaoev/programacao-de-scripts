# Atividade 11

Data de Entrega: 05/11/2022
Valor: 2,0 ponto na segunda nota.

Crie uma pasta chamada atividades/atividade11 e coloque os arquivos da atividade nela.

##### Questão 01) - 1,5 Pontos
Escreva o _script_ `compactador.sh` na pasta atividades/atividade11. O objetivo do _script_ é definir telas para executar as seguintes ações:

1. Apresentar uma tela requisitando o caminho de um diretório.
2. Formar uma lista com os nomes dos arquivos (sem subdiretórios) do diretório citado. O usuário deve escolher um ou mais arquivos.
3. Exibir duas opções de compactação: _gzip_ ou _b2zip_.
4. Questionar o nome do arquivo compactado a ser criado.
5. Criar o arquivo compactado com os arquivos selecionados do diretório e exibir uma tela de sucesso com o nome final do arquivo.

##### Questão 02) - 1,5 Pontos
Coloque os arquivos no pasta atividades/atividade11. Vamos fazer um pequeno servidor de arquivos.
* O _script_ `cliente.sh` deve receber três parâmetros: IP do Servidor, Porta do Servidor e o nome de um arquivo. Ele deve se conectar ao servidor enviando além do nome do arquivo desejado, o IP e Porta na qual espera o recebimento do arquivo.
* O _script_ `servidor.sh` deve escutar no IP e Porta fornecidos ao cliente. A cada conexão, deve procurar o arquivo requisitado no diretório no qual está executando e enviá-lo através do IP e Porta fornecidos pelo cliente.
* Para funcionar, tanto cliente quanto servidor devem estar na mesma rede ou em IPs válidos sem _firewall_ entre eles.

A dica é testar entre duas máquinas na AWS.
