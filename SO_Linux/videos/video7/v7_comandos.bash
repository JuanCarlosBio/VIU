#!/usr/bin/env bash

# Como no tengo los archivos de los datos, pues no puedo hacer gran cosa. 
# Voy a usar un excel que tengo por ahí la verdad

# gzip excel.xlsx

# El comando de gzip ha sido un completo fracaso la verdad pero bueno, es lo que hay

###### Juntar archivos con tar
# c = crear archivos con nombre birofitos.tar

echo "> Creamos un nuevo archivo juntando dos A.mougeotii"
tar -cf briofitos.tar *.txt
ls -lh
echo "> Eliminamos los ficheros que hemos juntado entonces"
rm Amphidium_mougeotii.txt
rm Amphidium_mougeotii_copy.txt
ls -lh
echo "======================================================================="
# -t --> lista el contenido, -f --> nombre del contenedior
echo "> Vemos el contenido del contenedor"
tar -tf briofitos.tar
ls -lh
echo "======================================================================="
# -x promovemos que se extraigan los archivos que se han juntado previamente 
echo "> Extraemos la información del contenedor"
tar -xf briofitos.tar
ls -l

echo "======================================================================="
# ¿Cómo podemos hacer un archivo comprimido?
echo "> Removemos el contenedor, volcemos al estadío inicial:"
rm briofitos.tar
ls -lh 
echo "======================================================================="

# Repetimos todo, pero la idea es que el contenedor esté comprimido
# para ello se utiliza -z con tar
# en ese sentifo los parámetros serían: -czf 1) crear 2) comprimir 3) nombre del 
# contenedor

tar -czf briofitos.tar.gz *.fasta # Me crea un archivo comprimido pero no va del 
                                  # todo fuc
ls
