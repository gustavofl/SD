#!/bin/bash

teste=1

while [ $teste ]
do

   top -n 3 | grep oned >> oned.txt
   date +%s >> oned.txt

done