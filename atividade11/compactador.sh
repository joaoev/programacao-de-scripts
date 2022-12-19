#!/bin/bash
# Correção: 1,5

CAMINHO=$(dialog --stdout \
				 --backtitle 'ATIVIDADE 11 - QUESTÃO 1 - By João Evangelista' \
                 --inputbox 'Digite o caminho do diretório:' 0 60)
LISTA_DE_ARQUIVOS=

clear

function executarPrograma ()
{

	if [ -d ${CAMINHO} ] ; then
	
		TOTAL_DE_ARQUIVOS=$(ls -l ${CAMINHO} | grep '^-' | wc -l)

		if [ ${TOTAL_DE_ARQUIVOS} = 0 ]; then
			dialog --title "Erro!" --infobox "DIRETÓRIO SEM ARQUIVOS." 5 30;sleep 3;clear
		else
		
			for NOME_ARQUIVO in $(ls -l ${CAMINHO} | grep '^-' | awk '{print $9}'); do
			LISTA_DE_ARQUIVOS=${LISTA_DE_ARQUIVOS}$(echo "${NOME_ARQUIVO} | OFF ")
			done


			ARQUIVOS=$(dialog --stdout --separate-output --backtitle 'ATIVIDADE 11 - QUESTÃO 1 - By João Evangelista' --checklist 'Use [ ESPAÇO ] para selecionar:' 20 50 10 ${LISTA_DE_ARQUIVOS})
		
			clear

			OPCAO_DE_COMPACTACAO=$( dialog --stdout --menu 'Opções de compactação:' 0 0 0   1 gzip 2 bzip2)

			clear

			NOME_ARQUIVO_COMPACTADO=$(dialog --stdout --backtitle 'ATIVIDADE 11 - QUESTÃO 1 - By João Evangelista' --inputbox 'Nome do arquivo compactado a ser criado:' 0 0)
		
			case ${OPCAO_DE_COMPACTACAO} in
				
					1)  NOME_ARQUIVO_COMPACTADO=${NOME_ARQUIVO_COMPACTADO}$(echo ".tar.gz")
						cd ${CAMINHO}
						sudo tar -czf ${NOME_ARQUIVO_COMPACTADO} ${ARQUIVOS}
				    	dialog --title "Arquivo compactado com Sucesso!" --infobox "${NOME_ARQUIVO_COMPACTADO}" 5 30;sleep 5;clear
					;;

					2)  NOME_ARQUIVO_COMPACTADO=${NOME_ARQUIVO_COMPACTADO}$(echo ".tar.bz2")
						cd ${CAMINHO}
						sudo tar -cjf ${NOME_ARQUIVO_COMPACTADO} ${ARQUIVOS}
				    	dialog --title "Arquivo compactado com Sucesso!" --infobox "${NOME_ARQUIVO_COMPACTADO}" 5 30;sleep 5;clear
					;;
			esac
		fi
	
	else
		dialog --title "Erro!" --infobox "DIRETÓRIO NÃO EXISTE." 5 30;sleep 3;clear
		
	fi
}


if [ -z ${CAMINHO} ]; then
	dialog --title "Erro!" --infobox "DIRETÓRIO NÃO EXISTE." 5 30;sleep 3;clear
else
	executarPrograma
fi
