#!/bin/bash

teste=1

while [ $teste ]
do

   top -n 3 | grep systemd >> systemd.txt
   date +%s >> systemd.txt

done
