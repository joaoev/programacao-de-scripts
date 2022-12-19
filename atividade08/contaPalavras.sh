#!/bin/bash
# Correção: 1,0

read -p "Informe o arquivo: " ARQUIVO
declare -a FRASE
declare -a FRASE_UNICA


i=0
for PALAVRA in $(cat ${ARQUIVO} | tr '[[:punct:]]' ' ' | tr '[[:upper:]]' '[[:lower:]]'); do
        FRASE[${i}]="${PALAVRA}"
        i=$((${i} + 1))
done

i=0
for PALAVRA_UNICA in $(cat ${ARQUIVO} | tr '[[:punct:]]' ' ' | tr '[[:upper:]]' '[[:lower:]]'| tr ' ' '\n' | sort | uniq); do
        FRASE_UNICA[${i}]="${PALAVRA_UNICA}"
        i=$((${i} + 1))
done


TOTAL=0
declare -a TOTAIS
for (( i = 0; i < ${#FRASE_UNICA[@]}; i++ )); do
        for (( j = 0; j < ${#FRASE[@]}; j++ )); do
                if [ "${FRASE_UNICA[$i]}" = "${FRASE[$j]}" ]; then
                         TOTAL=$((${TOTAL}+1))
                         TOTAIS[$i]="${TOTAL}"
                fi

        done
        TOTAL=0
done

MAIOR_PALAVRA=${FRASE_UNICA[0]}

for i in ${FRASE_UNICA[@]}; do
        if [ `echo -n ${MAIOR_PALAVRA} | wc -m` -le  `echo -n $i | wc -m` ]; then
          MAIOR_PALAVRA=$i      
        fi
done

TAM_MAIOR_PALAVRA=$(echo -n ${MAIOR_PALAVRA} | wc -m)
ESPACO=
j=0
for i in ${FRASE_UNICA[@]}; do
        TAM_PALAVRA=$(echo -n $i | wc -m)
        ESPACO=$(( (${TAM_MAIOR_PALAVRA} - ${TAM_PALAVRA}) + 1))
        
        FRASE_FINAL=${FRASE_FINAL}`printf "%s" "$i:"` 
        
        for (( k = 0; k < ${ESPACO}; k++ )); do
                FRASE_FINAL=${FRASE_FINAL}`printf "-"`
        done
        
        FRASE_FINAL=${FRASE_FINAL}`printf "%d#" "${TOTAIS[$j]}"`
        
        j=$((${j} + 1))
done

echo ${FRASE_FINAL} | tr '-' ' ' | tr '#' '\n' | sort -k 2nr
