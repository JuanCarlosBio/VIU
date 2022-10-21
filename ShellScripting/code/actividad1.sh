#!/usr/bin/env bash

###### Parte I de la actividad 
# Empezaremos con las líneas de cada uno de los archivos
echo ">>> Número de líneas de human_coordinates_1.bed"

wc -l ../data/human_coordinates_1.bed

echo ">>> Número de líneas de human_coordinates_2.bed"

wc -l ../data/human_coordinates_2.bed

echo "SIGUIENTE------------------------------------------------"

# Seguiremos contando el número de columnas con awk 

echo ">>> Número de columnas de human_coordinates_1.bed"

awk -F'\t' '{print NF}' ../data/human_coordinates_1.bed | uniq

echo ">>> Número de columnas de human_coordinates_2.bed"

awk -F'\t' '{print NF}' ../data/human_coordinates_2.bed | uniq

echo "SIGUIENTE-------------------------------------------------"

# ¿Hay representación de todos los cromosonas humanos en ambos los archivos?. 

echo ">>> Cormosomas de human_coordinates_1.bed"
cut -f1 ../data/human_coordinates_1.bed | sort -k1.4 -n | uniq  
echo ">> Nº de líneas de lo anterior, si es < a 23, no están todos los cormosomas"
cut -f1 ../data/human_coordinates_1.bed | sort -k1.4 -n | uniq | wc -l

echo ">>> Cormosomas de human_coordinates_2.bed"
cut -f1 ../data/human_coordinates_2.bed | sort -k1.4 -n | uniq
echo ">> Nº de líneas de lo anterior, si es < a 23, no están todos los cormosomas"
cut -f1 ../data/human_coordinates_2.bed | sort -k1.4 -n | uniq | wc -l

echo "SIGUIENTE-------------------------------------------------------------------------"

# Ahora vamos a ver si los datos difieren.
echo ">>> Ordenamos ambos datos y guardamos los resultados en un nuevo archivo"
sort -k 1.4 -n ../data/human_coordinates_1.bed > ../data/human_coordinates_1_ordered.bed  
sort -k 1.4 -n ../data/human_coordinates_2.bed > ../data/human_coordinates_2_ordered.bed 

echo ">> En caso de diferencias ¿Cuántas y que regiones son diferentes?"
diff ../data/human_coordinates_1_ordered.bed ../data/human_coordinates_2_ordered.bed -q ; diff ../data/human_coordinates_1_ordered.bed ../data/human_coordinates_2_ordered.bed 


