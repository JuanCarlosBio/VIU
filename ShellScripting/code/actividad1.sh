#!/usr/bin/env bash

###### Parte I de la actividad 
# Empezaremos con un vistazo de las 5 primeras líneas de cada 
# uno de los archivos

echo ">>> 5 Primeras líneas de human_coordinates_1.bed"

head -n 5 ../data/raw/human_coordinates_1.bed

echo ">>> 5 Primeras líneas de human_coordinates_2.bed"

head -n 5 ../data/raw/human_coordinates_2.bed

echo "FIN DE ESTA PARTE-------------------------------------------------------"

# Seguimos con las líneas de cada uno de los archivos
echo ">>> Número de líneas de human_coordinates_1.bed"

wc -l ../data/raw/human_coordinates_1.bed

echo ">>> Número de líneas de human_coordinates_2.bed"

wc -l ../data/raw/human_coordinates_2.bed

echo "FIN DE ESTA PARTE-------------------------------------------------------"

# Seguiremos contando el número de columnas con awk 

echo ">>> Número de columnas de human_coordinates_1.bed"

awk -F'\t' '{print NF}' ../data/raw/human_coordinates_1.bed | uniq

echo ">>> Número de columnas de human_coordinates_2.bed"

awk -F'\t' '{print NF}' ../data/raw/human_coordinates_2.bed | uniq

echo "FIN DE ESTA PARTE-------------------------------------------------------"

# ¿Hay representación de todos los cromosonas humanos en ambos los archivos?. 

echo ">>> Cormosomas de human_coordinates_1.bed"
cut -f1 ../data/raw/human_coordinates_1.bed | sort -k1.4 -n | uniq  
echo ">> Nº de líneas de lo anterior, si es < a 23, no están todos los cormosomas"
cut -f1 ../data/raw/human_coordinates_1.bed | sort -k1.4 -n | uniq | wc -l

echo ">>> Cormosomas de human_coordinates_2.bed"
cut -f1 ../data/raw/human_coordinates_2.bed | sort -k1.4 -n | uniq
echo ">> Nº de líneas de lo anterior, si es < a 23, no están todos los cormosomas"
cut -f1 ../data/raw/human_coordinates_2.bed | sort -k1.4 -n | uniq | wc -l

echo "FIN DE ESTA PARTE-------------------------------------------------------"

# Ahora vamos a ver si los datos difieren.
# OJO, vamos a crear dos nuevos archivos que son los datos procesados 
# ordenados de mayor a menor. Para que se vea bien en la memoria los
# llamaremos: 
# human_coordinates_1.bed -> hc1_ord.bed 
# human_coordinates_2.bed -> hc2_ord.bed 
echo ">>> Ordenamos ambos datos y guardamos los resultados en un nuevo archivo"

sort -k 1.4 -n ../data/raw/human_coordinates_1.bed > ../data/processed/hc1_ord.bed 

sort -k 1.4 -n ../data/raw/human_coordinates_2.bed > ../data/processed/hc2_ord.bed 

echo ">> En caso de diferencias ¿Cuántas y que regiones son diferentes?"
# Primero preguntamos me gusta la idea de pregunta si difieren
echo "> ¿Difieren?"
diff ../data/processed/hc1_ord.bed ../data/processed/hc2_ord.bed -q
# Lo siguiente ya es ver cuáles presentan en ese caso diferencias
echo "> ¿Dónde?"
diff ../data/processed/hc1_ord.bed ../data/processed/hc2_ord.bed 

echo "FIN DE ESTA PARTE-------------------------------------------------------"


