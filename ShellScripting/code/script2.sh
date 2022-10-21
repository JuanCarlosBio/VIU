#!/usr/bin/env bash

# Ahora vamos a ver si los datos difieren.
# OJO, vamos a crear dos nuevos archivos que son los datos procesados 
# ordenados de mayor a menor. Para que se vea bien en la memoria los
# llamaremos: 
# human_coordinates_1.bed -> hc_1_ord.bed 
# human_coordinates_2.bed -> hc_2_ord.bed 
echo ">>> Ordenamos ambos datos y guardamos los resultados en un nuevo archivo"

sort -k 1.4 -n ../data/human_coordinates_1.bed > ../data/hc_1_ord.bed 

sort -k 1.4 -n ../data/human_coordinates_2.bed > ../data/hc_2_ord.bed 

echo ">> En caso de diferencias ¿Cuántas y que regiones son diferentes?"
# Primero preguntamos me gusta la idea de pregunta si difieren
diff ../data/hc_1_ord.bed ../data/hc_2_ord.bed -q
# Lo siguiente ya es ver cuáles presentan en ese caso diferencias
diff ../data/hc_1_ord.bed ../data/hc_2_ord.bed 