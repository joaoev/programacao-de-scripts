#!/bin/bash
# Nota: 1,5

ARQUIVO=$1

for IP in `cat ${ARQUIVO}`; do
        PING=`ping -c 10 ${IP} | grep -E 'min/avg/max/mdev'`
        IP_COM_MS_AVG="${IP_COM_MS_AVG}-`echo ${PING} | cut -f4 -d' ' | cut -f2 -d'/'`ms ${IP}"
done

IP_ORDENADO=`echo ${IP_COM_MS_AVG} | tr -s '-'  '\n' | sort -n | sed '1d'`

oldIFS=${IFS}
IFS="\n"
TOTAL=`echo $IP_ORDENADO | wc -l`
IPs=`echo $IP_ORDENADO | tr -s '\n' '-'`
IFS=${oldIFS}

for i in `seq 1 1 ${TOTAL}`; do
        IFS="\n"
        IP_FINAL=`echo ${IPs} | cut -f$i -d"-" | cut -f2 -d" "`
        MS_FINAL=`echo ${IPs} | cut -f$i -d"-" | cut -f1 -d" "`
        IFS=${oldIFS}
        echo "${IP_FINAL} ${MS_FINAL}"
done
