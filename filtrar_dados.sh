#!/bin/bash

## OBTER O MENOR TEMPO INICIAL DOS ARQUIVOS
tempo_inicial=`head -n1 mysqld.txt`
if [ `head -n1 oned.txt` -lt $tempo_inicial ]; then
	tempo_inicial=`head -n1 oned.txt`
fi
if [ `head -n1 systemd.txt` -lt $tempo_inicial ]; then
	tempo_inicial=`head -n1 systemd.txt`
fi

./filtrar_dados_arquivo.sh mysqld $tempo_inicial
./filtrar_dados_arquivo.sh oned $tempo_inicial
./filtrar_dados_arquivo.sh systemd $tempo_inicial

./gerar_amostragem_dados.sh mysqld
./gerar_amostragem_dados.sh oned
./gerar_amostragem_dados.sh systemd

./gerar_amostragem_dados_tempo_it.sh