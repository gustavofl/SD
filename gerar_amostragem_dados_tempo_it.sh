#!/bin/bash

echo > dados_plot_tempo_it.txt

intervalo_amostragem=60
ultima_amostra=0
count=1

while read line
do
	echo $count $line >> dados_plot_tempo_it.txt
	count=$(($count+1))
done < tempo_it.txt