# **Apntes del vídeo 7 del CP Sistema Operativo Linux: Comandos de compresión y empaquetamiento de archivos** 

### ***Comprimir es reducir el tamaño de los archivos/directorios usando un algorítmo sin la pérdida de sus propiedades*** 

Archivos de .pdb hacen referencia a una de las mayores bases de datos de información estructural de macromoléculas conocida como protein data bank, encontramos diferentes tipod de metadatos e información de muchas proteínas y lo más importante tenemos la capacidad de almacenar las coordenadas artesianas x, y, z de la posición de los átomos. Podemos usar distintas herramientas para mostrar las estructuras de las proteínas.

El intento de comprimir archivos ha sido un poco fracaso la verdad.

**Esquema de tar: "+" = archivos**

---

+ + + + + -> tar -> c(+,+,+,+,+) -> gzip -> c(+)

---

* **INPUT of SAME**

```
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
```

* **OUTPUT of SAME**

```
> Creamos un nuevo archivo juntando dos A.mougeotii
total 52K
-rwxrwxrwx 1 juancarlos juancarlos 4.7K Aug 18 14:07 Amphidium_mougeotii.txt     
-rwxrwxrwx 1 juancarlos juancarlos 4.7K Aug 18 14:07 Amphidium_mougeotii_copy.txt
-rwxrwxrwx 1 juancarlos juancarlos  20K Sep 18 01:43 briofitos.tar
-rwxrwxrwx 1 juancarlos juancarlos    0 Sep 18 01:39 briofitos.tar.gz
-rwxrwxrwx 1 juancarlos juancarlos  700 Sep 18 01:38 otro.fasta
-rwxrwxrwx 1 juancarlos juancarlos  700 Sep 15 18:12 sample.fasta
-rwxrwxrwx 1 juancarlos juancarlos  840 Sep 18 01:40 v7_apuntes.md   
-rwxrwxrwx 1 juancarlos juancarlos 1.6K Sep 18 01:43 v7_comandos.bash
> Eliminamos los ficheros que hemos juntado entonces
total 36K
-rwxrwxrwx 1 juancarlos juancarlos  20K Sep 18 01:43 briofitos.tar     
-rwxrwxrwx 1 juancarlos juancarlos    0 Sep 18 01:39 briofitos.tar.gz  
-rwxrwxrwx 1 juancarlos juancarlos  700 Sep 18 01:38 otro.fasta        
-rwxrwxrwx 1 juancarlos juancarlos  700 Sep 15 18:12 sample.fasta      
-rwxrwxrwx 1 juancarlos juancarlos  840 Sep 18 01:40 v7_apuntes.md     
-rwxrwxrwx 1 juancarlos juancarlos 1.6K Sep 18 01:43 v7_comandos.bash  
=======================================================================
> Vemos el contenido del contenedor
Amphidium_mougeotii.txt
Amphidium_mougeotii_copy.txt
total 36K
-rwxrwxrwx 1 juancarlos juancarlos  20K Sep 18 01:43 briofitos.tar
-rwxrwxrwx 1 juancarlos juancarlos    0 Sep 18 01:39 briofitos.tar.gz
-rwxrwxrwx 1 juancarlos juancarlos  700 Sep 18 01:38 otro.fasta
-rwxrwxrwx 1 juancarlos juancarlos  700 Sep 15 18:12 sample.fasta
-rwxrwxrwx 1 juancarlos juancarlos  840 Sep 18 01:40 v7_apuntes.md
-rwxrwxrwx 1 juancarlos juancarlos 1.6K Sep 18 01:43 v7_comandos.bash
=======================================================================
> Extraemos la información del contenedor
total 52
-rwxrwxrwx 1 juancarlos juancarlos  4733 Aug 18 14:07 Amphidium_mougeotii.txt
-rwxrwxrwx 1 juancarlos juancarlos  4733 Aug 18 14:07 Amphidium_mougeotii_copy.txt
-rwxrwxrwx 1 juancarlos juancarlos 20480 Sep 18 01:43 briofitos.tar
-rwxrwxrwx 1 juancarlos juancarlos     0 Sep 18 01:39 briofitos.tar.gz
-rwxrwxrwx 1 juancarlos juancarlos   700 Sep 18 01:38 otro.fasta
-rwxrwxrwx 1 juancarlos juancarlos   700 Sep 15 18:12 sample.fasta
-rwxrwxrwx 1 juancarlos juancarlos   840 Sep 18 01:40 v7_apuntes.md
-rwxrwxrwx 1 juancarlos juancarlos  1623 Sep 18 01:43 v7_comandos.bash
=======================================================================
> Removemos el contenedor, volcemos al estadío inicial:
total 32K
-rwxrwxrwx 1 juancarlos juancarlos 4.7K Aug 18 14:07 Amphidium_mougeotii.txt
-rwxrwxrwx 1 juancarlos juancarlos 4.7K Aug 18 14:07 Amphidium_mougeotii_copy.txt
-rwxrwxrwx 1 juancarlos juancarlos    0 Sep 18 01:39 briofitos.tar.gz
-rwxrwxrwx 1 juancarlos juancarlos  700 Sep 18 01:38 otro.fasta
-rwxrwxrwx 1 juancarlos juancarlos  700 Sep 15 18:12 sample.fasta
-rwxrwxrwx 1 juancarlos juancarlos  840 Sep 18 01:40 v7_apuntes.md
-rwxrwxrwx 1 juancarlos juancarlos 1.6K Sep 18 01:43 v7_comandos.bash
=======================================================================
/bin/sh: 1: gzip: Exec format error
tar: Child returned status 126
tar: Error is not recoverable: exiting now
Amphidium_mougeotii.txt  Amphidium_mougeotii_copy.txt  briofitos.tar.gz  otro.fasta  sample.fasta  v7_apuntes.md  v7_comandos.bash
```