#!/usr/bin/env bash

# Enmpieza hablando de caracteres que no son recomendables para llamar directorio. Se veía claramente
# en el manual de la asignatura.

# Vamos a generar un directorio con mkdir.

echo "> Creamos el directorio con mkdir llamada proteinas y echamos un vistazo con ls"
# Obviamente lo comento después de hacerlo una primera vez en el script
mkdir proteinas
ls -lh

echo "================================================================================="

# lo siguiente es acceder al directorio
# con cd, lo cual no funciona directamente en el script. Hazlo en la línea de comandos
# con ls -a ves los directorios ocultos . --> directorio actual y .. directorio padre.

################# OJO FUTURO YO ANTES DE CONTINUAR CREA EL DIRECTORIO DE PROTEINAS #######################

# voy a hacer lo anterior en el escript escribiendo la ruta
echo "> Arvivos ocultos del directorio de proteinas "
ls -a proteinas # NICE

echo "================================================================================="

# Para eliminar direcotrio usaremos rmdir = remove directory.

echo "> Eliminamos el directorio de proteinas creado entonces"
rmdir proteinas
ls -l
echo "> Eliminado, NICE"

echo "================================================================================="

# Usó tree para ver un poco cada directorio desde su home y de esa manera crear una carpeta en Documents,
# eso no me va a servir a mí, vamos a probar lo siguiente. 

echo "> Mostaremos el arbol de la carpeta SO_Linux"
tree /mnt/c/Users/jcge9/Desktop/asignaturas_VIU

echo "================================================================================="

# Lo de abajo ha sido un fail abosoluto, lo que voy a hacer es crearlo directamenye en el directorio
# echo "> Creamos el directorio de proteinas en esa ruta"
# cd /mnt/c/Users/jcge9/Desktop/asignaturas_VIU/SO_Linux | mkdir proteinas | chmod +r /mnt/c/Users/jcge9/Desktop/asignaturas_VIU/SO_Linux

# para ejecutar el scrpit desde el directorio donde está proteinas: ./videos/video4/v4_comandos.bash 
# tambien crearemos la carpeta de análisis, glucidos y lipidos
# para estos dos ultimos, podemos usar mkdir glucidos lipidos escribiendo sólo una vez
# En caso de si quieres crear otro directorio dentro del que vas a crear puedes realizar lo sigueinete:

####  mkdir -p enzimas/lipasas

echo "> Vemos con ls si se ha creado la carpeta"
ls /mnt/c/Users/jcge9/Desktop/asignaturas_VIU/SO_Linux

echo "> Vamos a ver lo que hay en la carpeta de enxzimas "
ls /mnt/c/Users/jcge9/Desktop/asignaturas_VIU/SO_Linux/enzimas

echo "================================================================================="

################# OJO FUTURO YO ANTES DE CONTINUAR CREA LOS DIRECTORIOS DE NECESARIOS #######################

# Eliminar direcotrios, rmdir sirve solo para directorios vacíos, el de enzimas no se puede hacer
# de esta manera porque no está vacío, vamos a probar con los otros

echo "> Eliminamos las carpetas de los glucidos, proteinas, lipidos con rmdir, no me la quiero jugar con nada que tenga que ver con rm xd. Así que lo que voy a hacer es liminarlo desde la línea de comandos en con ```rmdir glucidos proteinas lipidos analisis``` y poner el output con ls y la ruta hasta el script, como anteriormente. ¿Eso hace que el script no sea automático? Sí, la vida es dura xd"
ls /mnt/c/Users/jcge9/Desktop/asignaturas_VIU/SO_Linux

# rmdir -r nos borra el contenido del directorio de forma recursiva, lo harmos para borrar enzimas/lipasas
echo "> Eliminamos enzimas/lipasas con la opción -r"
ls /mnt/c/Users/jcge9/Desktop/asignaturas_VIU/SO_Linux

echo "================================================================================="

# Vamos a volver a crear la carpeta de proteina. Pero lo haremos en el directorio del video 4

echo "> Creamos el directorio de proteinas y dentro de esta vamos a crear globulares y fibrosas"
# mkdir proteinas
# mkdir proteinas/globulares 
# mkdir proteinas/fibrosas 
ls proteinas

# Otra forma de crear los archivos-directorios es con touch
echo "> Vamos crear las carpetas deste las globulares"
touch proteinas/globulares/mioglobina
touch proteinas/globulares/queratina
ls proteinas/globulares # Ha funcionado de maravilla

# La queratina no es tipo de proteina globular, hay que trasladarlo a loas proteínas fibrosas

echo "================================================================================="

tree proteinas

echo "> Copiamos la queratina y la trasladamos a la ruta relativa de fibrosas"

cp proteinas/globulares/queratina proteinas/fibrosas

tree proteinas

echo "> NICE, lo eliminamos de la carpeta globulares"

rm proteinas/globulares/queratina

tree proteinas

echo "================================================================================="

# Esto anterior se puede hacer directamente con mv, no voy a volver a hacerl, la idea está clara. 
# Pero se puede hacer una cosa interesante, como cambiar el nombre.


# mv queratina QUERATINA # No me va ;( en el directorio.

#### Lo siguiente se pone a hablar des principio de la lista larga de ls --> archivos y perimosos

# Vamos a modificar los permisos del markdown, no me voy a volver muy loco, le voy a quitar/añadir permisos a
# al grupos g

# chmod g-wrx v4_apuntes.md  # Tampoco me va, que raro tío