#!/bin/bash
# Correção: 0,5. O arquivo copiado vazio. Não permite alterar a porta.

nc -l -w 1 8080 > nome_do_arquivo.txt
NOME_ARQUIVO_ENVIAR=$(cat nome_do_arquivo.txt)
nc -l -w 1 8080 < ${NOME_ARQUIVO_ENVIAR}
