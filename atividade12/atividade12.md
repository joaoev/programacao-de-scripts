# Atividade 12

Data de Entrega: 19/11/2022
Valor: 2,5 pontos na terceira nota.

Crie uma pasta chamada atividades/atividade12 e coloque os arquivos da atividade nela.

##### Questão Única - 2,5 Pontos
Você deve fazer um _script_ chamado `servidorWeb.sh` que ao ser executado, cria uma instância na AWS e carrega um servidor _web_ com uma página contendo seu nome e matrícula.
Exemplo da execução:
```
$ ./servidorWeb.sh nomedachave
Criando servidor...
Acesse: http://84.74.123.45/
```

Ao colocar o endereço retornado pelo _script_ no navegador, a página deve ser exibida.
Observe que a única informação que o usuário deve fornecer é o nome da chave, criada previamente. **O _script_ deve funcionar em qualquer conta da AWS na região _us-east-1_**. Observe os seguintes pontos:

1. Você pode anotar no _script_ o ID da AMI (imagem) do Ubuntu Linux, que é o mesmo para todos os usuários.
2. Recupere a subrede do VPC padrão.
3. Crie um grupo de segurança liberando a porta 22 e 80, TCP.
4. Crie a instância.

Para ajudar, consulte a documentação da [linha de comando](https://docs.aws.amazon.com/cli/latest/index.html) e o [tutorial](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html) de como utilizá-la.