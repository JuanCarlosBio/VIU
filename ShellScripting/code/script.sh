#!/usr/bin/env bash

# Filtramos los valores que nos interesa
grep -v a ../data/processed/hc_diff.bed > ../data/processed/hc_diff_processed.bed

#### Eliminamos los valores > que estorban

# Buscar el patrón que se desea elmiminar
read -p "Patrón 1 a buscar: " patron1 # > chr1 y chr17
read -p "Patrón 2 a buscar: " patron2 # > chr6

# Reemplazar el patrón 
read -p "Reemplazo del patrón: " reemplazo1 # chr1 y chr17
read -p "Reemplazo del patrón: " reemplazo2 # chr6


if [[ $patron1 != "" && $reemplazo1 != "" && $patron1 != "" && $reemplazo1 != "" ]]
then
sed -i "s/$patron1/$reemplazo1/" ../data/processed/hc_diff_processed.bed 
sed -i "s/$patron2/$reemplazo2/" ../data/processed/hc_diff_processed.bed
fi

# Vamos a unir los datos anteriores