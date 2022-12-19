#!/bin/bash
# Nota: 1,0
ls | sed -n '/.html/p' | sed s/\.html/\.htm/g | sed -e 's/[[:alnum:][:punct:][:blank:]]*/\U&/g'

sed -n -e 's/[ \t]A.[ \t]/ INF /p' -e 's/[ \t]B.[ \t]/ LOG /p' -e 's/[ \t]C.[ \t]/ RED /p' tabela_notas.txt

sudo sed -n 's/[ \t]A.[ \t]/ INF /p' tabela_notas.txt | sudo tee turma_inf.txt
sudo sed -n 's/[ \t]B.[ \t]/ LOG /p' tabela_notas.txt | sudo tee turma_log.txt
sudo sed -n 's/[ \t]C.[ \t]/ RED /p' tabela_notas.txt | sudo tee turma_red.txt

sed -n '1!p' tabela_notas.txt | 
sed -n 's/[[:alpha:][:blank:][:punct:]]*//p' |
sed -n 1p |
sed -n 's/\( \)\([0-9]\)/\1 + \2 + /p' | 
sed -n -e 's/^/scale=2;(/g' -e 's/$/)\/3/p' |
bc |
sudo tee -a medias.txt

sed -n '1!p' tabela_notas.txt | 
sed -n 's/[[:alpha:][:blank:][:punct:]]*//p' |
sed -n 2p |
sed -n 's/\( \)\([0-9]\)/\1 + \2 + /p' | 
sed -n -e 's/^/scale=2;(/g' -e 's/$/)\/3/p' |
bc |
sudo tee -a medias.txt

sed -n '1!p' tabela_notas.txt | 
sed -n 's/[[:alpha:][:blank:][:punct:]]*//p' |
sed -n 3p |
sed -n 's/\( \)\([0-9]\)/\1 + \2 + /p' | 
sed -n -e 's/^/scale=2;(/g' -e 's/$/)\/3/p' |
bc |
sudo tee -a medias.txt

sed -n '1!p' tabela_notas.txt | 
sed -n 's/[[:alpha:][:blank:][:punct:]]*//p' |
sed -n 4p |
sed -n 's/\( \)\([0-9]\)/\1 + \2 + /p' | 
sed -n -e 's/^/scale=2;(/g' -e 's/$/)\/3/p' |
bc |
sudo tee -a medias.txt

sed -n '1!p' tabela_notas.txt | 
sed -n 's/[[:alpha:][:blank:][:punct:]]*//p' |
sed -n 5p |
sed -n 's/\( \)\([0-9]\)/\1 + \2 + /p' | 
sed -n -e 's/^/scale=2;(/g' -e 's/$/)\/3/p' |
bc |
sudo tee -a medias.txt

sed -n '1!p' tabela_notas.txt | 
sed -n 's/[[:alpha:][:blank:][:punct:]]*//p' |
sed -n 6p |
sed -n 's/\( \)\([0-9]\)/\1 + \2 + /p' | 
sed -n -e 's/^/scale=2;(/g' -e 's/$/)\/3/p' |
bc |
sudo tee -a medias.txt

sed -n '1!p' tabela_notas.txt | 
sed -n 's/[[:alpha:][:blank:][:punct:]]*//p' |
sed -n 7p |
sed -n 's/\( \)\([0-9]\)/\1 + \2 + /p' | 
sed -n -e 's/^/scale=2;(/g' -e 's/$/)\/3/p' |
bc |
sudo tee -a medias.txt

sed -n '1!p' tabela_notas.txt | 
sed -n 's/[[:alpha:][:blank:][:punct:]]*//p' |
sed -n 8p |
sed -n 's/\( \)\([0-9]\)/\1 + \2 + /p' | 
sed -n -e 's/^/scale=2;(/g' -e 's/$/)\/3/p' |
bc |
sudo tee -a medias.txt

sudo touch  recuperacao.txt
sed -n 1p medias.txt| sed -n 's/$/ >= 6/p'  | bc -l | sudo tee -a passou.txt
sed -n 2p medias.txt| sed -n 's/$/ >= 6/p'  | bc -l | sudo tee -a passou.txt
sed -n 3p medias.txt| sed -n 's/$/ >= 6/p'  | bc -l | sudo tee -a passou.txt
sed -n 4p medias.txt| sed -n 's/$/ >= 6/p'  | bc -l | sudo tee -a passou.txt
sed -n 5p medias.txt| sed -n 's/$/ >= 6/p'  | bc -l | sudo tee -a passou.txt
sed -n 6p medias.txt| sed -n 's/$/ >= 6/p'  | bc -l | sudo tee -a passou.txt
sed -n 7p medias.txt| sed -n 's/$/ >= 6/p'  | bc -l | sudo tee -a passou.txt
sed -n 8p medias.txt| sed -n 's/$/ >= 6/p'  | bc -l | sudo tee -a passou.txt


echo "`sed -n 1p tabela_notas.txt`" | sudo tee -a tabela_atualizada.txt
echo "`sed -n 2p tabela_notas.txt` @`sed -n 1p passou.txt`" | sudo tee -a tabela_atualizada.txt
echo "`sed -n 3p tabela_notas.txt` @`sed -n 2p passou.txt`" | sudo tee -a tabela_atualizada.txt
echo "`sed -n 4p tabela_notas.txt` @`sed -n 3p passou.txt`" | sudo tee -a tabela_atualizada.txt
echo "`sed -n 5p tabela_notas.txt` @`sed -n 4p passou.txt`" | sudo tee -a tabela_atualizada.txt
echo "`sed -n 6p tabela_notas.txt` @`sed -n 5p passou.txt`" | sudo tee -a tabela_atualizada.txt
echo "`sed -n 7p tabela_notas.txt` @`sed -n 6p passou.txt`" | sudo tee -a tabela_atualizada.txt
echo "`sed -n 8p tabela_notas.txt` @`sed -n 7p passou.txt`" | sudo tee -a tabela_atualizada.txt
echo "`sed -n 9p tabela_notas.txt` @`sed -n 8p passou.txt`" | sudo tee -a tabela_atualizada.txt

sed -n '/@0/p' tabela_atualizada.txt |
sudo tee -a  recuperacao.txt

