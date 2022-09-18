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
