#!/bin/bash

# cat mysqld.txt | awk '{print $12, $6, $7, $8, $2}' > dados_mysql.txt
# cat oned.txt | awk '{print $12, $6, $7, $8, $2}' > dados_oned.txt
cat systemd.txt | awk '{print $12, $6, $7, $8, $2}' > dados_systemd.txt
# cat teste.txt | awk '{print $12, $6, $7, $8, $2}' > dados_teste.txt
