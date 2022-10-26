#!/usr/bin/env bash

# -> Comprobar comm
# paste numeros.txt genes.txt > text_nuevo.txt
# sort -n text_nuevo.txt # OJO, con -u además elimina los duplicados

paste numeros.txt genes.txt expresion.txt | sort -k 3
paste numeros.txt genes.txt expresion.txt | sort -k 2


echo "hola mundo cruel" | tr "[:blank:]" ",-"