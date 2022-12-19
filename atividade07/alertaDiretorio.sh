#!/bin/bash
# Correção: 2,0

INTERVALO=$1
DIRETORIO=$2

ARQUIVOS_ANT=""

for i in $(find "${DIRETORIO}" 2> /dev/null); do
	if $(test -f $i); then
		ARQUIVOS_ANT="${ARQUIVOS_ANT}#$(date -r ''$i'' +%d/%m/%y" "%H:%M:%S"|") $i"
	fi
done

DIR_TEMP=$(echo ${DIRETORIO} | sed 's/\//\\\//g')
ARQUIVOS_ANT=$(echo ${ARQUIVOS_ANT} | sed 's/^#//')

while [ true ]; do

ARQUIVOS_NOV=""
	
	for i in $(find "${DIRETORIO}" 2> /dev/null); do
		if $(test -f $i);then
			ARQUIVOS_NOV="${ARQUIVOS_NOV}#$(date -r ''$i'' +%d/%m/%y" "%H:%M:%S"|") $i"
		fi
	done

ARQUIVOS_NOV=$(echo ${ARQUIVOS_NOV} | sed 's/^#//')
NUMERO_ARQUIVOS_ANT=$(echo ${ARQUIVOS_ANT} | tr '#' '\n' | wc -l)
NUMERO_ARQUIVOS_NOV=$(echo ${ARQUIVOS_NOV} | tr '#' '\n' | wc -l)


	if $(test -z "${ARQUIVOS_NOV}"); then
		NUMERO_ARQUIVOS_NOV=0
	fi

	if $(test -z "${ARQUIVOS_ANT}"); then
		NUMERO_ARQUIVOS_ANT=0
	fi

NUMERO_ADD=0
ALTERADOS=""
REMOVIDOS=""
ADICIONADOS=""

	for i in $(seq 1 1 ${NUMERO_ARQUIVOS_NOV}); do
	TEMP=$(echo ${ARQUIVOS_NOV} | cut -f$i -d'#' | cut -f3- -d' ')
		if ! [ "$(echo ${ARQUIVOS_ANT} | tr '#' '\n' | grep "${TEMP}" | cut -f3- -d' ')" = "${TEMP}" ]; then
			NUMERO_ADD=$(expr ${NUMERO_ADD} + 1)
			ADICIONADOS=${ADICIONADOS}" "$(echo "$(echo ${TEMP} | sed 's/'${DIR_TEMP}'//' | cut -f2- -d'/'), ")
		fi
	done

	if [ ${NUMERO_ADD} -gt 0 ]; then
		ADICIONADOS="Adicionados: "${NUMERO_ARQUIVOS_ANT}"->"${NUMERO_ADD}" "$(echo ${ADICIONADOS} | sed 's/[, ]$//')
		echo "$(date +"["%d/%m/%y" "%H:%M:%S"] ")Alteração! ${ADICIONADOS}"
		echo "$(date +"["%d/%m/%y" "%H:%M:%S"] ")Alteração! ${ADICIONADOS}" >> dirSensors.log
		ADICIONADOS=""
	fi

NUMERO_REM=${NUMERO_ARQUIVOS_ANT}

	for i in $(seq 1 1 ${NUMERO_ARQUIVOS_ANT}); do
		TEMP=$(echo ${ARQUIVOS_ANT} | cut -f$i -d'#' | cut -f3- -d' ')
		if ! [ "$(echo ${ARQUIVOS_NOV} | tr '#' '\n' | grep "${TEMP}" | cut -f3- -d' ')" = "${TEMP}" ]; then
			NUMERO_REM=$(expr ${NUMERO_REM} - 1)
			REMOVIDOS=${REMOVIDOS}" "$(echo "$(echo ${TEMP} | sed 's/'${DIR_TEMP}'//' | cut -f2- -d'/'), ")
		fi
	done

	if [ "${NUMERO_REM}" -ne "${NUMERO_ARQUIVOS_ANT}" ]; then
		REMOVIDOS="Removidos: "${NUMERO_ARQUIVOS_ANT}"->"${NUMERO_REM}" "$(echo ${REMOVIDOS} | sed 's/[, ]$//')
		echo "$(date +"["%d/%m/%y" "%H:%M:%S"] ")Alteração! ${REMOVIDOS}"
		echo "$(date +"["%d/%m/%y" "%H:%M:%S"] ")Alteração! ${REMOVIDOS}" >> dirSensors.log
		REMOVIDOS=""
	fi

	for i in $(seq 1 1 ${NUMERO_ARQUIVOS_NOV}); do
		
		TEMP=$(echo ${ARQUIVOS_NOV} | cut -f$i -d'#' | cut -f3- -d' ')
		GREP_TOTAL=$(echo ${ARQUIVOS_ANT} | tr '#' '\n' | grep -E "${TEMP}" | wc -l)
		GREP_ANT=$(echo ${ARQUIVOS_ANT} | tr '#' '\n' | grep -E "${TEMP}" | cut -f1 -d'|')
		GREP_NOV=$(echo ${ARQUIVOS_NOV} | cut -f$i -d'#' | cut -f1 -d'|')
		
		if ! [ ${GREP_TOTAL} = 0 ]; then
			if [ "$(echo ${ARQUIVOS_ANT} | tr '#' '\n' | grep -E "${TEMP}" | cut -f3- -d' ')" = "${TEMP}" ]; then
				if ! [ "${GREP_ANT}" = "${GREP_NOV}" ]; then
					ALTERADOS=${ALTERADOS}" "$(echo "$(echo ${TEMP} | sed 's/'${DIR_TEMP}'//' | cut -f2- -d'/'), ")
				fi
			fi
		fi
	done

ALTERADOS="Alterados: "$(echo ${ALTERADOS} | sed 's/[, ]$//')

	if ! [ "Alterados: " = "${ALTERADOS}" ]; then
		echo "$(date +"["%d/%m/%y" "%H:%M:%S"] ")Alteração! ${ALTERADOS}"
		echo "$(date +"["%d/%m/%y" "%H:%M:%S"] ")Alteração! ${ALTERADOS}" >> dirSensors.log
	fi

	ARQUIVOS_ANT=${ARQUIVOS_NOV}
	sleep ${INTERVALO}
done

