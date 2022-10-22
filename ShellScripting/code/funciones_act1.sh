#!/usr/bin/env bash

# Funciones que me han parecido oportunas para tener

# Función para contar el nº de columnas
function ncol(){
    echo "Nº de columnas de $1"
    awk -F'\t' '{print NF}' $2 | uniq
}

# Función para estudiar los los cromosomas 
function ver_chr(){
    echo ">>> ¿Están todos los cromosomas en $1?"
    echo ">> Cormosomas del archivo $1"
    cut -f1 $2 | sort -k1.4 -n | uniq
    echo ">> Nº de líneas de $1, si es < a 23, faltan Chr"
    cut -f1 $2 | sort -k1.4 -n | uniq | wc -l
}