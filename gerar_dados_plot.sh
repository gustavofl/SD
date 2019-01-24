#!/bin/bash

count=1
while read line
do
	# minutos=`echo $(echo $line | awk '{print $1}' | awk -F: '{print $1}')*60*100 | bc`
	# segundos=`echo $(echo $line | awk '{print $1}' | awk -F: '{print $2}' | awk -F. '{print $1}')*60 | bc`
	# centesimos=`echo $line | awk '{print $1}' | awk -F: '{print $2}' | awk -F. '{print $2}'`
	# soma=`echo $minutos+$segundos+$centesimos | bc`

	minutos=`echo $line | awk '{print $1}' | awk -F: '{print $1}'`

	# dado_monitorado=`echo $line | awk '{print $3}'`

	# echo $soma $dado_monitorado
	echo $count $minutos

	count=`echo $count+1 | bc`
done < dados.txt