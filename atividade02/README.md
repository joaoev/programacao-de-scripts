# Atividade 02

Data da Entrega: 03/09/2022

Valor: 1,0 ponto na Primeira Nota.

O objetivo desta atividade é fazer que o aluno use bastante o terminal, para se acostumar com o ambiente em linha de comando. Não use ferramentas gráficas para auxiliar, faça tudo pelo bash. 

Crie uma pasta chamada atividades no seu diretório de usuário. Dentro dela coloque uma pasta chamada atividade02. O caminho completo deve ser atividades/atividade02.

Em seguida, dentro da pasta atividade02, crie três pastas:



    professores

    disciplinas

    historico



Na pasta professores, você deve criar uma arquivo de texto vazio para cada professor do campus. Acesse a página do Campus e recupere o nome de cada docente. Por exemplo, para João Marcelo Uchôa de Alencar, você deve criar o arquivo joao_marcelo_uchoa_de_alencar.txt. Se o professor já não está no campus, pode colocar o que você lembrar do nome dele.



Na pasta disciplinas, você deve criar um arquivo de texto vazio para cada disciplina obrigatória do seu curso. Na página do curso há a grade completa. Por exemplo, para Fundamentos de Programação, você deve criar o arquivo fundamentos_de_programacao.txt.



Na pasta historico, você deve criar, de acordo com a nomenclatura acima, uma pasta para cada disciplina que já foi aprovado. Dentro dessa pasta, deve haver dois links simbólicos (soft links):



    programa: deve apontar para o arquivo da disciplina na pasta disciplinas.
    professor: deve apontar para o arquivo do professor na pasta professores.


Atenção: os links deve ser relativos à pasta da disciplina no histórico. Em outras palavras, se você copiar o repositório em outra pasta, os links devem continuar válidos.

Veja abaixo o exemplo para uma única disciplina:

```
.
├── disciplinas
│   └── fundamentos_de_programacao.txt
├── historico
│   └── fundamentos_de_programacao
│       ├── professor -> professores/joao_marcelo_uchoa_de_alencar.txt
│       └── programa -> disciplinas/fundamentos_de_programacao.txt
└── professores
|    └── joao_marcelo_uchoa_de_alencar.txt
````
