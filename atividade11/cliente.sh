#!/bin/bash

IP_SERVIDOR=$1
PORTA_SERVIDOR=$2
ARQUIVO=$3

echo ${ARQUIVO} > nome_do_arquivo.txt 
NOME_ARQUIVO_RECEBER=$(cat nome_do_arquivo.txt)
nc -w 1 ${IP_SERVIDOR} ${PORTA_SERVIDOR} < nome_do_arquivo.txt
nc -w 1 ${IP_SERVIDOR} ${PORTA_SERVIDOR} > ${NOME_ARQUIVO_RECEBER}
