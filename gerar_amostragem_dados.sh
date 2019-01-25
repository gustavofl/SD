#!/bin/bash

echo > dados_plot_$1.txt

intervalo_amostragem=60
ultima_amostra=0

while read line
do
	amostra=`echo $line | awk '{print $1}'`
	if [[ $amostra-$ultima_amostra -ge $intervalo_amostragem ]]; then 
		minutos_amostra=`echo $amostra/60 | bc`
		dados=`echo $line | awk '{print $2, $3, $4}'`
		
		echo $minutos_amostra $dados >> dados_plot_$1.txt

		ultima_amostra=$amostra
	fi

done < dados_$1.txt