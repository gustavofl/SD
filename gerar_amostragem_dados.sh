#!/bin/bash

echo > dados_plot_$1.txt

intervalo_amostragem=60
ultima_amostra=0

while read line
do
	amostra=`echo $line | awk '{print $1}'`
	if [[ $amostra-$ultima_amostra -ge $intervalo_amostragem ]]; then 
		minutos_amostra=`echo $amostra/60 | bc`
		mem_virtual=`echo "scale=3;$(echo $line | awk '{print $2}')/1000" | bc`
		mem_residente=`echo "scale=3;$(echo $line | awk '{print $3}')/1000" | bc`
		mem_compartilhada=`echo "scale=3;$(echo $line | awk '{print $4}')/1000" | bc`
		
		echo $minutos_amostra $mem_virtual $mem_residente $mem_compartilhada >> dados_plot_$1.txt

		ultima_amostra=$amostra
	fi

done < dados_$1.txt