#!/usr/bin/env bash

###### Parte I de la actividad 
# Empezaremos con las líneas de cada uno de los archivos
echo ">>> Número de líneas de human_coordinates_1.bed"

wc -l ../data/human_coordinates_1.bed

echo ">>> Número de líneas de human_coordinates_2.bed"

wc -l ../data/human_coordinates_2.bed

echo "Siguiente------------------------------------------------"

# Seguiremos contando el número de columnas con awk 

echo ">>> Número de columnas de human_coordinates_1.bed"

awk -F'\t' '{print NF}' ../data/human_coordinates_1.bed | sort -nu

echo ">>> Número de columnas de human_coordinates_2.bed"

awk -F'\t' '{print NF}' ../data/human_coordinates_2.bed | sort -nu

echo "Siguiente-------------------------------------------------"

# ¿Hay representación de todos los cromosonas humanos en ambos los archivos?. 
# No sé muy bien a qué se refiere ahora mismo 
# En un primer vistazo con cat no lo parece, faltan algunos, supongo que habrá alguna
# manera para verlo de forma más profesional. 

# echo ">>> human_coordinates_1.bed"
# cat ../data/human_coordinates_1.bed 
# echo ">>> human_coordinates_2.bed"
# cat ../data/human_coordinates_2.bed