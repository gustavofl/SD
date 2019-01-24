#!/bin/bash

cont=1
inc=512
estado="VALOR"

while [ $cont -le 6000 ]
do
   onevm create lubuntu_template.tmpl
   estado1=`date +%s`
   while [ "$estado" != "RUNNING" ]
   do
      onevm show $inc >> pesquisa.txt
      estado=`grep -o "RUNNING" pesquisa.txt`
   done
   echo -n > pesquisa.txt

   onevm terminate --hard $inc
   while [ "$estado" != "DONE" ]
   do
      onevm show $inc >> pesquisa.txt
      estado=`grep -o "DONE" pesquisa.txt`
   done
   estado2=`date +%s`
   estado3=`expr $estado2 - $estado1`
   echo $estado3 >> tempo_it.txt
   echo -n > pesquisa.txt
   
   inc=`expr $inc + 1`
   cont=`expr $cont + 1`
   echo "OK"

done
