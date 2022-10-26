#!/usr/bin/env bash

# Concatenar comandos, pipr, ; y && ||

# cat /etc/passwd
# Filtrar
# grep "pcoip" /etc/passwd
# Filtrar y creación de archivos intermedios
# grep "pcoip" /etc/passwd > pcoip.txt
# campos separados por : y dame el tercer campo
# grep "pcoip" /etc/passwd | cut -d":" -f3 > uid.txt

# tail -2 /etc/passwd | head -1 | cut -d":" -f3 > uid2.txt | cat uid2.txt

# echo "1º" | tail -5 /etc/shadow 2> error.txt && echo ">>> Puedo abrir este archivo?"
# echo "2º" |tail -5 /etc/shadow || echo ">>> Puedo abrir este archivo?"
# cat error.txt

# cat > fichero.txt

# OJO!!! concatenar

# cat archivo1.txt archivo2.txt

# Contar el número de líneas
# cat -n sesion.sh

####### "paste"

# OJO!!! importante -> 

# paste -d":," genes.txt g.txt samples.txt

# join para unir campos!