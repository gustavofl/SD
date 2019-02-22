#!/bin/bash

## copiar arquivos de dados para uma pasta separada

# verificar se diretorio existe (se não existir, criar agora)
if [ ! -d "dados" ]
then
	mkdir dados
fi

echo "copiando dados para pasta separada"

cp mysqld.txt dados
cp oned.txt dados
cp systemd.txt dados
cp tempo_it.txt dados

cd dados

declare -a arquivos=("mysqld.txt" "oned.txt" "systemd.txt")

## remover ultimas e primeiras linhas desnecessarias/corrompidas dos arquivos de dados (exceto tempo_it)

echo
echo "removendo linhas corrompidas nos arquivos de dados"

for arq in "${arquivos[@]}"
do
	# verifica se a primeira linha é de dados ou epoch
	segunda_coluna=`head -n1 $arq | awk '{print $2}'`
	while [[ "$segunda_coluna" -ne "" ]]
	do
		# apagar se for dados
		sed -i 1d $arq
		segunda_coluna=`head -n1 $arq | awk '{print $2}'`
	done

	# verifica se a ultima linha esta corrompida
	primeira_coluna=`tail -n1 $arq | awk '{print $1}'`
	if [[ $primeira_coluna -eq 0 ]]
	then
		# apagar se estiver corrompida
		sed -i '$d' $arq
	fi

	# verifica se a ultima linha é de dados ou epoch
	segunda_coluna=`tail -n1 $arq | awk '{print $2}'`
	while [[ "$segunda_coluna" -ne "" ]]
	do 
		# apagar se for dados
		sed -i '$d' $arq
		segunda_coluna=`tail -n1 $arq | awk '{print $2}'`
	done

	echo $arq OK
done

## remover ultimas e primeiras linhas desnecessarias/corrompidas dos arquivos de dados (exceto tempo_it)

# verifica se a ultima linha esta corrompida
primeira_coluna=`tail -n1 tempo_it.txt | awk '{print $1}'`
if [[ $primeira_coluna -eq 0 ]]
then
	# apagar se estiver corrompida
	sed -i '$d' tempo_it.txt
fi

echo tempo_it.txt OK
echo

## subir para o git, no branch dados_frontend

# obter o maio tempo final dos arquivos
echo "subindo para o github"

tempo_final=`tail -n1 mysqld.txt`
if [ `tail -n1 oned.txt` -gt $tempo_final ]; then
	tempo_final=`tail -n1 oned.txt`
fi
if [ `tail -n1 systemd.txt` -gt $tempo_final ]; then
	tempo_final=`tail -n1 systemd.txt`
fi

data=`date -d@$tempo_final`
dia=`echo $data | awk '{print $3}'`
mes=`echo $data | awk '{print $2}'`
hora=`echo $data | awk '{print $4}' | awk -F: '{print $1}'`
minutos=`echo $data | awk '{print $4}' | awk -F: '{print $2}'`

titulo_commit=`echo dados $dia-$mes $hora-$minutos "(teste da automacao de coletas de dados)"`

echo titulo do commit: $titulo_commit

cd ..
git add dados/*.txt -f
git commit -m "$titulo_commit"
git push origin automacao_coleta_dados # dados_frontend