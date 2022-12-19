#!/bin/bash
# Correção: 1,0

adicionar ()
{
	echo "$1	$2" >> hosts.db
}

remover ()
{
	sed -i "/$1/d" hosts.db
}

procurar ()
{
	cat hosts.db | grep $1 | cut -d'	' -f2
}

listar ()
{
	cat hosts.db
}

reverso ()
{
	cat hosts.db | grep $1 | cut -d'	' -f 1
}

while getopts "a:i:d:r:l" OPTVAR; do
	case "${OPTVAR}" in
		a )
			HOST=${OPTARG}
			;;
		i )
			IP=${OPTARG}
			;;
		d )
			HOST_PARA_EXCLUIR=${OPTARG}
			;;
		l )
			LISTAR="LISTAR"
			;;
		r )
			BUSCA_REVERSA=${OPTARG}
			;;
	esac
done

if ! [ -z ${HOST} ]; then
	if ! [ -z ${IP} ]; then
		adicionar ${HOST} ${IP}
	fi
else
	if ! [ -z ${HOST_PARA_EXCLUIR} ]; then
		remover ${HOST_PARA_EXCLUIR}
	else
		if ! [ -z ${BUSCA_REVERSA} ]; then
			reverso ${BUSCA_REVERSA}
		else
			if ! [ -z ${LISTAR} ]; then
				listar
			else
				if ! [ -z $1 ]; then
					procurar $1
				fi
			fi
		fi
	fi	
fi
