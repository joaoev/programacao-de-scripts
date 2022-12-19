#!/bin/bash
# Nota: 1,5

OPCAO=$1
NOME=$2
EMAIL=$3
ARQUIVO=$(ls | grep 'agenda.db')

if [[ ${OPCAO} ==  "adicionar" ]] ;then
        if  [[ ${ARQUIVO} == "agenda.db" ]] ;then
                echo "${NOME}:${EMAIL}" >> agenda.db
                echo "Usuário ${NOME} adicionado."
        else
                echo "${NOME}:${EMAIL}" >> agenda.db
                echo "Arquivo criado!!!"
                echo "Usuário ${NOME} adicionado."
        fi
else
        if [[ ${OPCAO} == "listar" ]] ;then
                if [[ ${ARQUIVO} == "agenda.db" ]] ;then
                        cat agenda.db
                else
                        echo "Arquivo vazio!!!"
                fi
        else
                if [[ ${OPCAO} == "remover" ]] ;then
                        if [[ ${ARQUIVO} == "agenda.db" ]] ;then
				PARA_REMOVER=$(grep $2 agenda.db)
                                if ! [[ ${PARA_REMOVER} == "" ]] ;then
                                        NOME_DO_USUARIO_EXCLUIDO=$(grep $2 agenda.db | sed -n 's/:[[:alnum:][:punct:][:blank:]]*//p')
                                        sed -i "/${PARA_REMOVER}/d" agenda.db
                                        echo "Usuário ${NOME_DO_USUARIO_EXCLUIDO} removido."
                                else
                                        echo "Usuário removido."
                                fi
                        else
                                echo "Usuário removido."
                        fi
                fi
        fi
fi
