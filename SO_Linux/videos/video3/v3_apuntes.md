# **Apuntes sobre el vídeo 3 de CP Sistemas Operativos Linux**.

## ***Interfaz de línea de comandos (CLI), para el manejo de directorios***.

Por que usar CLI?

* Ejecutar archivos
* Automatizar programas
* Realizar comandos

## ***Se usará la terminal Mate.***

### **script 1 del vídeo 3, INPUT**

```
#!/usr/bin/env bash

######## Comenzamos con el entorno Mate, yo uso ubuntu en VSC xd

# el comando Juan Carlos si le das no lo encuentra. Pero escribiendo date, le damos una  instrucción 
# para que ejecutarla, en este caso nos da la hora. hay que ser precisos, ya que si no lo 
# ponemos en mayúscula (DATE) no lo reconoce. Linux reconoce mayúsculas y minúsculas.

echo "Hello Linux World xd, Esta es la fecha de hoy"
date

echo "================================================="

# Se encuentra esta instrucción a partir de la información a partir de la herramienta almacenada en PATH.
# SHELL, si lo encuentra va a ejecutar el comando mediante la serie de instrcuciones. Si no nos da el mensaje
# de error. Podemos ver la ruta usando echo.

# Le añadimos el símbolo $ ya que nos interesa el contenido de la variable PATH, no la palabra.

echo "Aquí es donde está el comando, en este PATH, suena a Sabio de los Seis Caminos de Naruto lol"

echo $PATH

echo "================================================="

# Otra variable interesante el la SHELL, existen varios tipos de SHELL, repetimos el comando anterior.
# Adelanto que es la SHELL de Bash, de las más utilizadas. 

echo "este es el SHELL con el que estamos trabajando."
echo $SHELL

echo "================================================="

# Comando clear no lo voy a hacer, si tienes un lapsus es limpiar la pantalla guau xd

# Abrir la calculadora, con lo anterior funciona? supongo que lo vamos a comprobar. Ok no funciona xd
# el comando es bc, escribelo directamente en la terminal. Sirve, NICE. Se sale con --> quit.

# Podemos saber el comando pwd --> print working directory

echo "este es el direcotrio actual"
pwd

echo "================================================="

# Ver diferentes archivos de directorios a partir de varios comandos:

echo "Usamos dir a secas, muestra los diferentes archivos"
dir
echo "La opción -l nos da una lista larga (una letra 1 -, palabras completas --)"
dir -l
#   mkdir downloadas_guapas
echo "listame los archivos que se encuntren con dir, en una lista larga del directorio anterior"
dir -l downloadas_guapas/

echo "================================================="

# Autocompletar con                                 TAB 

# Ahora viene el Papi ls, nos diferencia los archivos por colores. creo que no van si usas un scripts xd.
# Los colores son para plebeyos.

echo "-a lista los archivos del sistemas y los ocultos (cuyo nombre empiezan por puntos)"
ls -a
echo "lista larga -l, -h nos da el tamaño cuqui, together they are powerful"
ls -lh

# Comandos de ayuda. Ojo, en mi corta experiencia de programación, si si... muy guay man, --help... o ? en R...
# super profesional, máximo programer... buscar en google en la increíble. Tanto para buscar comandos como ver 
# como un random ha solucionado un error que te ha salido y no tienes ni idea de como solucionarlo es una
# solución increíble xd.

# comandos de ayuda usar: man, --help, info, whatis (de forma reducida para que sirve comando)... pero eso es mejor hacerlo directamente en la terminal.

echo "whatis no se carga el script"

whatis ls

echo "================================================="

# viajar en directorios con cd
echo " Con cd .. Subimos un nivel en la estructura de archivos, que nos vamos para el directorio de pa trás xd... 
y no funciona en el script wua wua"

# Comando tree funciona como ls, pero en un diagrama de árbol más bonito, muy fancy.
# Yo para descargarlo tube que hacer:

# sudo apt-get install tree

# Ella en el escritorio virtual usa sudo yum install tree, pero no me va en ubuntu

tree

# con history nos da el historial los comandos no funciona en el script, escribirlo directamenete en la
# terminal.
```

### **Resultados del script 1 del vídeo 3, OUTPUT**

```
Hello Linux World xd, Esta es la fecha de hoy
Thu Sep 15 20:57:47 WEST 2022
=================================================
Aquí es donde está el comando, en este PATH, suena a Sabio de los Seis Caminos de Naruto lol
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/mnt/c/Program Files (x86)/Common Files/Oracle/Java/javapath:/mnt/c/Windows/system32:/mnt/c/Windows:/mnt/c/Windows/System32/Wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0/:/mnt/c/Windows/System32/OpenSSH/:/mnt/c/Program Files (x86)/Intel/Intel(R) Management Engine Components/DAL:/mnt/c/Program Files/Intel/Intel(R) Management Engine Components/DAL:/mnt/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/mnt/c/Program Files/NVIDIA Corporation/NVIDIA NvDLISR:/mnt/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/:/mnt/c/WINDOWS/System32/OpenSSH/:/mnt/c/Program Files/Git/cmd:/mnt/c/Users/jcge9/AppData/Local/Microsoft/WindowsApps:/mnt/c/Users/jcge9/AppData/Local/Programs/Microsoft VS Code/bin:/mnt/c/Users/jcge9/AppData/Roaming/TinyTeX/bin/win32:/snap/bin        
=================================================
este es el SHELL con el que estamos trabajando.
/bin/bash
=================================================
este es el direcotrio actual
/mnt/c/Users/jcge9/Desktop/asignaturas_VIU/SO_Linux/videos/video3
=================================================
Usamos dir a secas, muestra los diferentes archivos
Base2briofitos  downloadas_guapas  v3_apuntes.md  v3_comandos.bash
La opción -l nos da una lista larga (una letra 1 -, palabras completas --)
total 4
drwxrwxrwx 1 juancarlos juancarlos  512 Sep 15 20:47 Base2briofitos
drwxrwxrwx 1 juancarlos juancarlos  512 Sep 15 20:00 downloadas_guapas
-rwxrwxrwx 1 juancarlos juancarlos  366 Sep 15 20:27 v3_apuntes.md
-rwxrwxrwx 1 juancarlos juancarlos 3677 Sep 15 20:57 v3_comandos.bash
listame los archivos que se encuntren con dir, en una lista larga del directorio anterior
total 0
-rwxrwxrwx 1 juancarlos juancarlos 19 Sep 15 20:00 ey.txt
=================================================
-a lista los archivos del sistemas y los ocultos (cuyo nombre empiezan por puntos)
.  ..  Base2briofitos  downloadas_guapas  v3_apuntes.md  v3_comandos.bash
lista larga -l, -h nos da el tamaño cuqui, together they are powerful
total 4.0K
drwxrwxrwx 1 juancarlos juancarlos  512 Sep 15 20:47 Base2briofitos
drwxrwxrwx 1 juancarlos juancarlos  512 Sep 15 20:00 downloadas_guapas
-rwxrwxrwx 1 juancarlos juancarlos  366 Sep 15 20:27 v3_apuntes.md
-rwxrwxrwx 1 juancarlos juancarlos 3.6K Sep 15 20:57 v3_comandos.bash
whatis no se carga el script
ls (1)               - list directory contents
=================================================
 Con cd .. Subimos un nivel en la estructura de archivos, que nos vamos para el directorio de pa trás xd...
y no funciona en el script wua wua
.
├── Base2briofitos
│   ├── Amphidium_mougeotii.txt
│   ├── Barbilophozia_attenuata.txt
│   ├── Bryum_argenteum.txt
│   ├── Calypogeia_fissa.txt
│   ├── Crossocalyx_hellerianus_global.txt
│   ├── Crossocalyx_hellerianus_global_sorted.txt
│   ├── Crossocalyx_hellerianus_pop_M.txt
│   ├── Crossocalyx_hellerianus_pop_N.txt
│   ├── Crossocalyx_hellerianus_pop_P.txt
│   ├── Crossocalyx_hellerianus_pop_S.txt
│   ├── Crossocalyx_hellerianus_pop_V.txt
│   ├── Crossocalyx_hellerianus_pop_Y.txt
│   ├── Crossocalyx_hellerianus_pop_Z.txt
│   ├── Crossocalyx_hellerianus_population_G.txt
│   ├── Crossocalyx_hellerianus_population_K.txt
│   ├── Diplophyllum_albicans.txt
│   ├── Metzgeria_furcata.txt
│   ├── Orthotrichum_affine.txt
│   ├── Orthotrichum_handiense.txt
│   ├── Orthotrichum_lyellii.txt
│   ├── Plagiochila_asplenioides.txt
│   ├── Plagiomnium_undulatum.txt
│   ├── Plagiothecium_denticulatum.txt
│   ├── Plagiothecium_undulatum.txt
│   ├── Pleurochaete_squarrosa_ITS.txt
│   ├── Pleurochaete_squarrosa_cpDNA.txt
│   ├── Pleurozium_schreberi.txt
│   ├── Rhynchostegium_riparioides_Belgium.txt
│   ├── Rhynchostegium_riparioides_SW_Europe.txt
│   ├── Rhytidiadelphus_squarrosus.txt
│   ├── Scorpiurium_circinatum.txt
│   ├── Sphagnum_warnstorfii.txt
│   ├── Timmia_austriaca.txt
│   ├── Timmia_bavarica.txt
│   └── v3_comandos2.bash
├── downloadas_guapas
│   └── ey.txt
├── v3_apuntes.md
└── v3_comandos.bash

2 directories, 38 files
```

### **script 2 del vídeo 3, INPUT**

```
#!/usr/bin/env bash

# Continuaré con un segundo script ya que tengo que saltar de directorio y es una movida. Más o menos alrededor 
# del minuto ~32 min

# Ahora entra en una carpeta con análisis archivos de texto. Voy a añadir alguna de mis carpetas con alguna base de
# datos. Ella usa secuencias de genes... Sofisticated... yo usaré briófitos... que pasa?... Soy biólogo, a que
# quieres que te gane?. En verdad en los archivos se estudian locus... close enough.

echo "Vemos que hay..."
ls -l 

echo "================================================="

# Si usamos * solo, nos nombra todo el directorio. 
# ls -l Base2briofitos *
# Pero lo si usamos detrás de una letra/cadena de texto, nos da por lo que empieza hasta el asterisco.
echo "Solo quiero ver los que empiezan por O*, que no ha muchos"
ls -l O*

echo "================================================="

echo "Los archivos de texo, *.txt"
ls -l *.txt
```

# **Resultados del script 2 del vídeo 3, OUTPUT**

```
Vemos que hay...
total 548
-rwxrwxrwx 1 juancarlos juancarlos  4733 Aug 18 14:07 Amphidium_mougeotii.txt
-rwxrwxrwx 1 juancarlos juancarlos  4603 Aug 18 14:07 Barbilophozia_attenuata.txt
-rwxrwxrwx 1 juancarlos juancarlos  1524 Aug 18 14:07 Bryum_argenteum.txt
-rwxrwxrwx 1 juancarlos juancarlos  2795 Aug 18 14:07 Calypogeia_fissa.txt
-rwxrwxrwx 1 juancarlos juancarlos 25886 Aug 18 14:07 Crossocalyx_hellerianus_global.txt
-rwxrwxrwx 1 juancarlos juancarlos 25887 Sep  9 12:09 Crossocalyx_hellerianus_global_sorted.txt
-rwxrwxrwx 1 juancarlos juancarlos  5531 Aug 18 14:07 Crossocalyx_hellerianus_pop_M.txt
-rwxrwxrwx 1 juancarlos juancarlos 15840 Aug 18 14:07 Crossocalyx_hellerianus_pop_N.txt
-rwxrwxrwx 1 juancarlos juancarlos  1437 Aug 18 14:07 Crossocalyx_hellerianus_pop_P.txt
-rwxrwxrwx 1 juancarlos juancarlos 73722 Aug 18 14:07 Crossocalyx_hellerianus_pop_S.txt
-rwxrwxrwx 1 juancarlos juancarlos 77682 Aug 18 14:07 Crossocalyx_hellerianus_pop_V.txt
-rwxrwxrwx 1 juancarlos juancarlos  2248 Aug 18 14:07 Crossocalyx_hellerianus_pop_Y.txt
-rwxrwxrwx 1 juancarlos juancarlos 42858 Aug 18 14:07 Crossocalyx_hellerianus_pop_Z.txt
-rwxrwxrwx 1 juancarlos juancarlos  8157 Aug 18 14:07 Crossocalyx_hellerianus_population_G.txt
-rwxrwxrwx 1 juancarlos juancarlos 48617 Aug 18 14:07 Crossocalyx_hellerianus_population_K.txt
-rwxrwxrwx 1 juancarlos juancarlos  2842 Aug 18 14:07 Diplophyllum_albicans.txt
-rwxrwxrwx 1 juancarlos juancarlos  4635 Aug 18 14:07 Metzgeria_furcata.txt
-rwxrwxrwx 1 juancarlos juancarlos  3233 Aug 18 14:07 Orthotrichum_affine.txt
-rwxrwxrwx 1 juancarlos juancarlos 12168 Aug 18 14:07 Orthotrichum_handiense.txt
-rwxrwxrwx 1 juancarlos juancarlos  7892 Aug 18 14:07 Orthotrichum_lyellii.txt
-rwxrwxrwx 1 juancarlos juancarlos  6212 Aug 18 14:07 Plagiochila_asplenioides.txt
-rwxrwxrwx 1 juancarlos juancarlos  5665 Aug 18 14:07 Plagiomnium_undulatum.txt
-rwxrwxrwx 1 juancarlos juancarlos  3994 Aug 18 14:07 Plagiothecium_denticulatum.txt
-rwxrwxrwx 1 juancarlos juancarlos  3466 Aug 18 14:07 Plagiothecium_undulatum.txt
-rwxrwxrwx 1 juancarlos juancarlos  6773 Aug 18 14:07 Pleurochaete_squarrosa_ITS.txt
-rwxrwxrwx 1 juancarlos juancarlos  4566 Aug 18 14:07 Pleurochaete_squarrosa_cpDNA.txt
-rwxrwxrwx 1 juancarlos juancarlos 13638 Aug 18 14:07 Pleurozium_schreberi.txt
-rwxrwxrwx 1 juancarlos juancarlos 21530 Aug 18 14:07 Rhynchostegium_riparioides_Belgium.txt
-rwxrwxrwx 1 juancarlos juancarlos 17357 Aug 18 14:07 Rhynchostegium_riparioides_SW_Europe.txt
-rwxrwxrwx 1 juancarlos juancarlos  9913 Aug 18 14:07 Rhytidiadelphus_squarrosus.txt
-rwxrwxrwx 1 juancarlos juancarlos  1780 Aug 18 14:07 Scorpiurium_circinatum.txt
-rwxrwxrwx 1 juancarlos juancarlos 19434 Aug 18 14:07 Sphagnum_warnstorfii.txt
-rwxrwxrwx 1 juancarlos juancarlos  4726 Aug 18 14:07 Timmia_austriaca.txt
-rwxrwxrwx 1 juancarlos juancarlos  2378 Aug 18 14:07 Timmia_bavarica.txt
-rwxrwxrwx 1 juancarlos juancarlos   928 Sep 15 20:59 v3_comandos2.bash
=================================================
Solo quiero ver los que empiezan por O*, que no ha muchos
-rwxrwxrwx 1 juancarlos juancarlos  3233 Aug 18 14:07 Orthotrichum_affine.txt
-rwxrwxrwx 1 juancarlos juancarlos 12168 Aug 18 14:07 Orthotrichum_handiense.txt
-rwxrwxrwx 1 juancarlos juancarlos  7892 Aug 18 14:07 Orthotrichum_lyellii.txt
=================================================
Los archivos de texo, *.txt
-rwxrwxrwx 1 juancarlos juancarlos  4733 Aug 18 14:07 Amphidium_mougeotii.txt
-rwxrwxrwx 1 juancarlos juancarlos  4603 Aug 18 14:07 Barbilophozia_attenuata.txt
-rwxrwxrwx 1 juancarlos juancarlos  1524 Aug 18 14:07 Bryum_argenteum.txt
-rwxrwxrwx 1 juancarlos juancarlos  2795 Aug 18 14:07 Calypogeia_fissa.txt
-rwxrwxrwx 1 juancarlos juancarlos 25886 Aug 18 14:07 Crossocalyx_hellerianus_global.txt
-rwxrwxrwx 1 juancarlos juancarlos 25887 Sep  9 12:09 Crossocalyx_hellerianus_global_sorted.txt
-rwxrwxrwx 1 juancarlos juancarlos  5531 Aug 18 14:07 Crossocalyx_hellerianus_pop_M.txt
-rwxrwxrwx 1 juancarlos juancarlos 15840 Aug 18 14:07 Crossocalyx_hellerianus_pop_N.txt
-rwxrwxrwx 1 juancarlos juancarlos  1437 Aug 18 14:07 Crossocalyx_hellerianus_pop_P.txt
-rwxrwxrwx 1 juancarlos juancarlos 73722 Aug 18 14:07 Crossocalyx_hellerianus_pop_S.txt
-rwxrwxrwx 1 juancarlos juancarlos 77682 Aug 18 14:07 Crossocalyx_hellerianus_pop_V.txt
-rwxrwxrwx 1 juancarlos juancarlos  2248 Aug 18 14:07 Crossocalyx_hellerianus_pop_Y.txt
-rwxrwxrwx 1 juancarlos juancarlos 42858 Aug 18 14:07 Crossocalyx_hellerianus_pop_Z.txt
-rwxrwxrwx 1 juancarlos juancarlos  8157 Aug 18 14:07 Crossocalyx_hellerianus_population_G.txt
-rwxrwxrwx 1 juancarlos juancarlos 48617 Aug 18 14:07 Crossocalyx_hellerianus_population_K.txt
-rwxrwxrwx 1 juancarlos juancarlos  2842 Aug 18 14:07 Diplophyllum_albicans.txt
-rwxrwxrwx 1 juancarlos juancarlos  4635 Aug 18 14:07 Metzgeria_furcata.txt
-rwxrwxrwx 1 juancarlos juancarlos  3233 Aug 18 14:07 Orthotrichum_affine.txt
-rwxrwxrwx 1 juancarlos juancarlos 12168 Aug 18 14:07 Orthotrichum_handiense.txt
-rwxrwxrwx 1 juancarlos juancarlos  7892 Aug 18 14:07 Orthotrichum_lyellii.txt
-rwxrwxrwx 1 juancarlos juancarlos  6212 Aug 18 14:07 Plagiochila_asplenioides.txt
-rwxrwxrwx 1 juancarlos juancarlos  5665 Aug 18 14:07 Plagiomnium_undulatum.txt
-rwxrwxrwx 1 juancarlos juancarlos  3994 Aug 18 14:07 Plagiothecium_denticulatum.txt
-rwxrwxrwx 1 juancarlos juancarlos  3466 Aug 18 14:07 Plagiothecium_undulatum.txt
-rwxrwxrwx 1 juancarlos juancarlos  6773 Aug 18 14:07 Pleurochaete_squarrosa_ITS.txt
-rwxrwxrwx 1 juancarlos juancarlos  4566 Aug 18 14:07 Pleurochaete_squarrosa_cpDNA.txt
-rwxrwxrwx 1 juancarlos juancarlos 13638 Aug 18 14:07 Pleurozium_schreberi.txt
-rwxrwxrwx 1 juancarlos juancarlos 21530 Aug 18 14:07 Rhynchostegium_riparioides_Belgium.txt
-rwxrwxrwx 1 juancarlos juancarlos 17357 Aug 18 14:07 Rhynchostegium_riparioides_SW_Europe.txt
-rwxrwxrwx 1 juancarlos juancarlos  9913 Aug 18 14:07 Rhytidiadelphus_squarrosus.txt
-rwxrwxrwx 1 juancarlos juancarlos  1780 Aug 18 14:07 Scorpiurium_circinatum.txt
-rwxrwxrwx 1 juancarlos juancarlos 19434 Aug 18 14:07 Sphagnum_warnstorfii.txt
-rwxrwxrwx 1 juancarlos juancarlos  4726 Aug 18 14:07 Timmia_austriaca.txt
-rwxrwxrwx 1 juancarlos juancarlos  2378 Aug 18 14:07 Timmia_bavarica.txt
```