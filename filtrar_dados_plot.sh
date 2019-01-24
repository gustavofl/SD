#!/bin/bash

systemd=$1

count=0
count_tempo=0
while read line
do
	pid=`echo $line | awk '{print $5}'`
	if (( $pid == 1 || $systemd != 1 )); then
		if (( $count % 20 == 0 )); then
			minutos_cpu=`echo $line | awk '{print $1}' | awk -F: '{print $1}'`
			mem_virt=`echo $line | awk '{print $2}'`
			mem_res=`echo $line | awk '{print $3}'`
			mem_shr=`echo $line | awk '{print $4}'`
			
			echo $count_tempo $minutos_cpu $mem_virt $mem_res $mem_shr

			count_tempo=`echo $count_tempo+1 | bc`
		fi

		count=`echo $count+1 | bc`
	fi
done