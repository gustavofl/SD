#!/bin/bash

teste=1

while [ $teste ]
do

   top -n 3 | grep mysqld >> mysqld.txt
   date +%s >> mysqld.txt

done
