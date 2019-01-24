set xlabel 'Tempo (minutos)'
set ylabel 'Memoria (Bytes)'

plot 'dados_grafico_mysql.txt' using 1:3 title 'Memoria virtual'
plot 'dados_grafico_mysql.txt' using 1:4 title 'Memoria residente'
plot 'dados_grafico_mysql.txt' using 1:5 title 'Memoria compartilhada'

plot 'dados_grafico_oned.txt' using 1:3 title 'Memoria virtual'
plot 'dados_grafico_oned.txt' using 1:4 title 'Memoria residente'
plot 'dados_grafico_oned.txt' using 1:5 title 'Memoria compartilhada'

plot 'dados_grafico_systemd.txt' using 1:3 title 'Memoria virtual'
plot 'dados_grafico_systemd.txt' using 1:4 title 'Memoria residente'
plot 'dados_grafico_systemd.txt' using 1:5 title 'Memoria compartilhada'

plot 'dados_grafico_mysql.txt' using 1:3 title 'mysql (Memoria virtual)' with lines lw 3 lt 1, \
'dados_grafico_oned.txt' using 1:3 title 'oned (Memoria virtual)' with lines lw 3 lt 2, \
'dados_grafico_systemd.txt' using 1:3 title 'systemd (Memoria virtual)' with lines lw 3 lt 3

plot 'dados_grafico_mysql.txt' using 1:4 title 'mysql (Memoria residente)' with lines lw 3 lt 1, \
'dados_grafico_oned.txt' using 1:4 title 'oned (Memoria residente)' with lines lw 3 lt 2, \
'dados_grafico_systemd.txt' using 1:4 title 'systemd (Memoria residente)' with lines lw 3 lt 3

plot 'dados_grafico_mysql.txt' using 1:5 title 'mysql (Memoria compartilhada)' with lines lw 3 lt 1, \
'dados_grafico_oned.txt' using 1:5 title 'oned (Memoria compartilhada)' with lines lw 3 lt 2, \
'dados_grafico_systemd.txt' using 1:5 title 'systemd (Memoria compartilhada)' with lines lw 3 lt 3

# MEMORIA VIRTUAL
plot 'dados_grafico_mysql.txt' using 1:3 title 'mysql' with lines lw 3 lt 1, \
'dados_grafico_oned.txt' using 1:3 title 'oned' with lines lw 3 lt 2, \
'dados_grafico_systemd.txt' using 1:3 title 'systemd' with lines lw 3 lt 3

# MEMORIA RESIDENTE
plot 'dados_grafico_mysql.txt' using 1:4 title 'mysql' with lines lw 3 lt 1, \
'dados_grafico_oned.txt' using 1:4 title 'oned' with lines lw 3 lt 2, \
'dados_grafico_systemd.txt' using 1:4 title 'systemd' with lines lw 3 lt 3

# MEMORIA COMPARTILHADA
plot 'dados_grafico_mysql.txt' using 1:5 title 'mysql' with lines lw 3 lt 1, \
'dados_grafico_oned.txt' using 1:5 title 'oned' with lines lw 3 lt 2, \
'dados_grafico_systemd.txt' using 1:5 title 'systemd' with lines lw 3 lt 3