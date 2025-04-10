# Atividade 04

Data de Entrega: 17/09/2022
Valor: 2,0 pontos na Primeira nota.

Crie uma pasta chamada atividades/atividade04 e coloque os arquivos da atividade nela.

#### Questão 01)
Escreva um script chamado `saudacao.sh` que imprima a seguinte saudação ao ser executado:

    Olá username,
    Hoje é dia 20, do mês 10 do ano de 2021.
    
Instruções:
1. No lugar de _username_, deve ser exibido o usuário que está executando o script.
2. A data exibida deve ser a data atual da execução, sendo que o script deve funcionar sem alterações seja qual for o dia que for executado.
3. Dica: você pode usar os comandos _echo, who e date_.
4. Veja mais informações sobre o date em [Formatando o Date](https://www.vivaolinux.com.br/artigo/Formatando-exibicao-de-datas-no-Linux).


Por último, toda vez que o script for executado, além de exibir a saudação na tela, deve anexar a saudação ao arquivo `saudacao.log` no mesmo diretório de execução.

#### Questão 02)
Crie um arquivo chamado `sed.sh` com os seguintes comandos sed:

a) Considere que você tem um diretório com vários arquivos, alguns com a extensão .html. Use o sed para selecionar todos os arquivos com extensão .html dada a saída do comando ls e transformá-los em nomes com todas as letras maiúsculas e com a extensão .htm. Por exemplo:

```sh
$ ls
document.pdf
myPage.html
test.html
$ ls | sed <SEUCOMANDO>
MYPAGE.HTM
TEST.HTM
$
```
b) Considere um arquivo com o seguinte conteúdo:

    NOME TURMA NOTA1 NOTA2 NOTA3
    João     A     7     8     9
    Maria    A     5     7     7
    Carlos   B     6     4     6
    Ana      A     3     9     7
    Helena   C     3     4     7
    Luisa    C     9     8    10
    Maite    C    10     9     8
    Chico    B     5     3     8

Essa questão exige vários comandos sed. Coloque um abaixo do outro.
Primeiro, em um único comando sed, altere A para INF, turma B para LOG e turma C para RED.
Em seguida, crie um arquivo para cada turma, contendo apenas os alunos das respectivas turmas (não precisa ser um único comando).
Por último, informe o comando que cria um novo arquivo, chamado `recuperacao.txt`, contendo apenas os alunos com média abaixo de 6.
