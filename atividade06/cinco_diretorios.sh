#!/bin/bash
# Nota: 1,5

mkdir cinco
cd cinco

for i in `seq 1 1 5`; do
        mkdir "dir${i}"
        cd  "dir${i}"
                for j in `seq 1 1 4`; do
                        touch "arq${j}.txt"
                                for k in `seq 1 1 $j`; do
                                echo "${j}" >> "arq${j}.txt"
                                done
                done
        cd ..
done
