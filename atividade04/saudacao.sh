#!/bin/bash
# Nota: 1,0
echo "Olá `whoami | sed 's/  [[:alnum:][:punct:][:blank:]]*//g'`," | tee -a saudacao.log
echo `date +"Hoje é dia %d, do mês %m do ano de %Y."` | tee -a saudacao.log 
