#!/usr/bin/env bash

rm output.txt error.txt  # Esto me permite obtener siempre el misomo output de forma
                         # automática :). 

rmdir midirectorio


# Vamos a redireccionar el contenido de la carpeta de SO_Linux  a un nuevo archivo en la
# carpeta que estamos trabajando en este script (video8).

echo "> Redirecionamos el contenido de SO_Linux a un nuevo archivo del directorio actual al cuál llamaremos output.txt"
ls -lh /mnt/c/Users/jcge9/Desktop/asignaturas_VIU/SO_Linux > output.txt

echo "> Vemos el contenido del nuevo archivo"
cat output.txt

# Ocurre una salvedad con el vídeo, como yo no he creado en el archivo en el mismo direc_
# torio, no me sale output.txt. Si en vez del contenido fuese el del directorio en el que
# estamos trabajando, como output.txt se forma antes que la redirección, nos saldría en la
# lista formada por el comando ls.

echo "========================================================================================"

echo "> Contaremos el número de líneas del nuevo archivo"

wc -l output.txt # Tiene 7 líneas

# Ojo!!!! cada vez que hagamos el input, el output sobrescribe al inical, cuidado con eso
# malas experiencias y sustos he tenido ya con cosas similares :(. Esto anterior se puede
# solucionar entonces con ">>".

echo "> Vamos a sobrescribir con >>, con lo cuál, el contenido debería repetirse dos veces" 
ls -lh /mnt/c/Users/jcge9/Desktop/asignaturas_VIU/SO_Linux >> output.txt
cat output.txt # NICE
echo "> Contamos el número de líneas, deberían ser el doble"
wc -l output.txt

echo "========================================================================================"

# Vamos a hacer lo anterior pero en caso de querer ver algún error. Distinguimos el stout
# y el sterr a partir de su desriptor. > usa de forma predeterminada "1", y quereomos el 
# error "2" -> se haría poniendo 2>

echo "> Pulsa "F" por el comando perdido"
ls -l F 2> error.txt
cat error.txt
echo "            2xF xd"

echo "========================================================================================"

# Lo complicamos un poco más. Vamos a pedir con el comando ls que nos liste un comando no
# existente y oto directorio que si. El primero nos va a dar error, el segundo por otro lado
# no y reprterá un resultado archivo/directo. Combinaremos ambas salidas de la siguente manera:

echo "Lo que hacemos primero es hacer que el resultado correcto sobrescriba al archivo original de output.txt que teníamos. Por otro lado el error me lo va a redireccionar a al archivo de error.txt que teníamos"
ls F /mnt/c/Users/jcge9/Desktop/asignaturas_VIU/SO_Linux/videos/video8 > output.txt 2> error.txt
echo "> Contenido de correcto, lista del directorio video 8"
cat output.txt 
echo "> Contenido de error"
cat error.txt

echo "========================================================================================"

# Redirección de archivos de entrada estándar, se usa "<"
echo "> Creamos un archivo llamado colores"
touch colores.txt
echo "> Añadimos carácteres a este archivo, usa vim y yo nano, por que soy así, un rebelde antisistema >:)"
nano colores.txt
echo "> Lo ordenamos de forma alfabéticamente y lo transferimos a un comando"
sort < colores.txt 

echo "========================================================================================"

# Vamos ahora a combinar comandos y redirecciones, veremos tres formas.
# 1) Tuberías (pipes |)

echo "> Vamos a obtener una lista del direcotorio video8 lo interconectamos con una pipe para contar las palabras de este. Date cuenta que no hay que repetir el enlace del directorio en el comando wc, ya que este actuará sobre el resultado del primer comando ls. Lo que vemos es que el resultado es únicamente las palabras contadas. Además lo redireccionamos a un archivo de cuentas.txt"
ls /mnt/c/Users/jcge9/Desktop/asignaturas_VIU/SO_Linux/videos/video8 | wc -w > cuentas.txt | cat cuentas.txt

# 2) punto y coma, esto no interconecta comandos, si no que los ejecuta de forma 
#    independiente cada uno, pero en orden. 
# comando1 ; comando2 ; comando3 ...

# Esto puede ser muy útil a la hora de correr scripts que pueden tardar los suyo
# en correrlo. Por ejemplo, quiero instalar dos o varios paquetes (o instalo 1 y 
# quiero actualizarlo), tardan bastante, por ello uso punto y coma, para que cuando
# un paquete se intale comience el otro sin perder excesivo tiempo.

#### Ejemplo:

# sudo yum -y update ; sudo install synaptic

# 3.1) Ejecución condicional. Los comandos son dependientes entre sí. Para que corra
#    el segundo comando, el primero tiene que haber sido exitoso, o el segundo func_
#    ionará para arreglar el error del primero.

# operador & ejecuta el comando si el anterior lo hace de forma correcta.
echo "> Creamos un direcotorio nuevo, y luego hacemos una lista, como no hay nada no sale nada xd, usamos ls en el direcotio de video8 para corroborar que se ha creado el nuevo"
mkdir midirectorio && ls midirectorio

# 3.2) operador "or" || Ejecución de uno de los comandos que hagamos. 
echo "Vamos a ver si existe el archivo.txt, y en caso de que lo haga, printame lo siguiente mediante el perador &&. En caso de que no exista lo crearomos con el operador ||"
[ -f miarchivo.txt ] && echo "El archivo miarchivo.txt existe" || touch miarchivo.txt 

# No lo voy a borrar. Cuando corras el script de nuevo saldrá el archovo existe.








