#!/bin/bash

systemd=0
if [ $1 = systemd ]; then
	systemd=1
fi

echo > dados_$1.txt

primeiro_tempo=$2
ultimo_tempo=0
ultimos_dados=""
while read line
do
	if [ -n "`echo $line | grep $1`" ]; then
		pid=`echo $line | awk '{print $2}'`
		if [ $ultimo_tempo != 0 ] && [[ $pid = 1 || $systemd != 1 ]]; then
			ultimos_dados=`echo $line | awk '{print $6, $7, $8, $2}'`
			# echo $(($ultimo_tempo-$primeiro_tempo)) $ultimos_dados >> dados_$1.txt
			echo $ultimo_tempo $ultimos_dados >> dados_$1.txt
			ultimo_tempo=0
		fi
	else
		if [ $ultimo_tempo != 0 ] && [ -n "$ultimos_dados" ]; then
			# echo $(($ultimo_tempo-$primeiro_tempo)) $ultimos_dados >> dados_$1.txt
			echo $ultimo_tempo $ultimos_dados >> dados_$1.txt
		fi

		ultimo_tempo=`echo $line | awk '{print $1}'`
	fi
done < dados/$1.txt