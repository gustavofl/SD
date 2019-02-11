#!/bin/bash

./filtrar_dados.sh

## OBTER O MAIOR TEMPO FINAL DOS ARQUIVOS
tempo_final=`tail -n1 mysqld.txt`
if [ `tail -n1 oned.txt` -lt $tempo_final ]; then
	tempo_final=`tail -n1 oned.txt`
fi
if [ `tail -n1 systemd.txt` -lt $tempo_final ]; then
	tempo_final=`tail -n1 systemd.txt`
fi

data=`date -d@$tempo_final`
dia=`echo $data | awk '{print $3}'`
mes=`echo $data | awk '{print $2}'`
hora=`echo $data | awk '{print $4}' | awk -F: '{print $1}'`
minutos=`echo $data | awk '{print $4}' | awk -F: '{print $2}'`

nome_pasta=`echo $dia-$mes $hora-$minutos`

## Verificar se a pasta existe
if [ -d "imagens/$nome_pasta" ]; then
	echo "Ja existe uma pasta com imagens desses dados, deseja sobrescrever os arquivos?"
	echo "Sobrescrevendo imagens."
else
	mkdir "imagens/$nome_pasta"
fi

rm ultimas_imagens
ln -s "imagens/$nome_pasta" ultimas_imagens

gnuplot "script gnuplot.txt"
gnuplot "script gnuplot portugues.txt"