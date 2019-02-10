#!/bin/bash

echo > dados_plot_tempo_it.txt

count=1
while read line
do
	tempo=`echo "scale=1; $line/60" | bc`
	echo $count $tempo >> dados_plot_tempo_it.txt
	count=$(($count+1))
done < tempo_it.txt