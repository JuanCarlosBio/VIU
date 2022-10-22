#!/usr/bin/env bash

# IMPORTANTE!!! Antes que nada obtenemos las funciones creadas en 
# el otro script llamado funciones_act1.sh, nos serán útiles.
source funciones2.sh

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

# Nº de columnas de cada archivo
ncol human_coordinates_1 ../data/raw/human_coordinates_1.bed
ncol human_coordinates_2 ../data/raw/human_coordinates_2.bed

echo "FIN DE ESTA PARTE-------------------------------------------------------"

# ¿Hay representación de todos los cromosonas humanos en ambos los archivos?.  

ver_chr human_coordinates_1 ../data/raw/human_coordinates_1.bed
ver_chr human_coordinates_2 ../data/raw/human_coordinates_2.bed

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
diff ../data/processed/hc1_ord.bed ../data/processed/hc2_ord.bed > ../data/processed/hc_diff.bed

cat ../data/processed/hc_diff.bed

echo "FIN DE ESTA PARTE-------------------------------------------------------"

# Filtramos los valores que nos interesa
grep -v a ../data/processed/hc_diff.bed > ../data/processed/hc_diff_processed.bed

#### Eliminamos los valores > que estorban

# Buscar el patrón que se desea elmiminar
read -p "Patrón 1 a buscar: " patron1 # > chr1 y chr17 -> sólo > chr1 suficiente
read -p "Patrón 2 a buscar: " patron2 # > chr6

# Reemplazar el patrón 
read -p "Reemplazo del patrón: " reemplazo1 # chr1 y chr17
read -p "Reemplazo del patrón: " reemplazo2 # chr6


if [[ $patron1 != "" && $reemplazo1 != "" && $patron1 != "" && $reemplazo1 != "" ]]
then
sed -i "s/$patron1/$reemplazo1/" ../data/processed/hc_diff_processed.bed 
sed -i "s/$patron2/$reemplazo2/" ../data/processed/hc_diff_processed.bed
fi

cat ../data/processed/hc_diff_processed.bed

echo "FIN DE ESTA PARTE-------------------------------------------------------"

# Vamos a unir los datos anteriores
awk ' {print $1 ":"  $2 "-" $NF } ' ../data/processed/hc_diff_processed.bed > ../data/processed/hc_diff_processed2.bed  

echo ">>> Visualizamos los datos que presentaban diferencias procesados"
cat ../data/processed/hc_diff_processed2.bed

echo "FIN DE ESTA PARTE-------------------------------------------------------"

# Creamos un archivo con los genes