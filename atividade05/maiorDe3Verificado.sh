#!/bin/bash
# Nota: 0,5

NUMERO_1=$1
NUMERO_2=$2
NUMERO_3=$3

EXPRESSAO='[0-9]'

if ! [[ ${NUMERO_1} =~ ${EXPRESSAO} ]];then
        echo "Opa!!! ${NUMERO_1} não é número."
else
        if ! [[ ${NUMERO_2} =~ ${EXPRESSAO} ]];then
                echo "Opa!!! ${NUMERO_2} não é número."
        else
                if ! [[ ${NUMERO_3} =~ ${EXPRESSAO} ]];then
                        echo "Opa!!! ${NUMERO_3} não é número."
                else
                        if $(test ${NUMERO_1} -gt ${NUMERO_2} && test ${NUMERO_1} -gt ${NUMERO_3}) ;then
                                echo ${NUMERO_1}
                        else
                                if $(test ${NUMERO_2} -gt ${NUMERO_1} && test ${NUMERO_2} -gt ${NUMERO_3}) ;then
                                        echo ${NUMERO_2}
                                else
                                        echo ${NUMERO_3}
                                fi
                        fi
                fi
        fi
fi
