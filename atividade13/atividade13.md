# Atividade 13

Data de Entrega: 03/12/2022
Valor: 2,5 pontos na terceira nota.

##### Questão Única - 2,5 Pontos
O nome do _script_ principal da atividade deve ser `instanciaServico.sh`.
Esta atividade tem duas partes: treinamento e produção. Só a parte **produção** será corrigida. O **treinamento** é para preparar o terreno.
##### Treinamento
Considere o _script_ a seguir:
```sh
#!/bin/bash

while true
do
   DATA=$(date +%H:%M:%S-%D)
   echo "$DATA Servidor Ativo" >> /var/log/mensagens.log
   sleep 5
done
```

Crie uma instância através do console da AWS e configure um serviço _SystemD_ para executar esse _script_. Inicie o _script_ sem reiniciar a instância para ter certeza que ele executa corretamente. Depois, certifique-se que o serviço funciona mesmo após a instância ser reiniciada.

##### Produção
Até este ponto, você deve ter entendido que um script com um laço dentro é iniciado pelo _SystemD_ e se mantém em execução. Agora vamos para o que o `instanciaServico.sh` deve fazer.
A execução deve ser igual a atividade anterior, mantendo a chave caso o professor deseje entrar na instância durante a correção:

```
$ ./instanciaServico.sh nomedachave
Criando servidor de Monitoramento...
Acesse: http://84.74.123.45/   
```

Seu _script_ além de criar a máquina virtual, deve instalar um serviço nela que de 5 em 5 segundos colete informações do estado da máquina e exiba o resultado na página _index_.

1. O horário e data da coleta de informações.
2. Tempo que a máquina está ativa.
3. Carga média do sistema.
4. Quantidade de memória livre e ocupada.
5. Quantidade de _bytes_ recebidos e enviados através da interface _eth0_.

Todas essas informações já foram assunto de atividade anterior, menos a última, que pode ser obtida lendo o arquivo `/proc/net/dev`. Lembre-se que você pode usar o comando _cat_ e o operador << para fazer com que um _script_ crie outro _script_ ou arquivo de texto qualquer:

```sh
cat << EOF > script.sh
#!/bin/bash
while true
do
   DATA=$(date +%H:%M:%S-%D)
   echo "$DATA Servidor Ativo" >> /var/log/mensagens.log
   sleep 5
done    
EOF
```
                        
Você não precisa fazer um _HTML_ complicado, só tente organizar as informações em uma tabela ou lista. Não é para simplesmente jogar a saída dos comandos para o arquivo.