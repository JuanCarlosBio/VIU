#!/usr/bin/env bash

rm enlace_duro.txt # Con esto el script funciona always :)
# Extracción del Inodo de un archivo.

# Crearemos un archivo, en este caso con touch
echo "> Creamos el archivo original.txt"
touch original.txt # Los comento por si acaso sobreescriben el resultado
echo "Para verificar que está vacío usamos cat"
cat original.txt
# Abrimos el ditor de texto con vim (nano es >>>>>>>>>>>>>>>> vim haters gonna hate)

echo "============================================================================================="

vim original.txt # esta un poco feo que lo diga, pero es un poco canceroso

echo "> Con la letra -i obtenemos el número del inodo de cada archivo, además al lado de los permisos nos da el número de en laces"
ls -li 

# Podemos ver el inodo también con el comando stat
echo "> Usamos para ver el stat para ver información adicional del archivo."
stat original.txt

echo "============================================================================================="

# Generaremos enlaces duros y simbólicos además del enlace original (1).

echo "> Creamos en enlace duro"
ln original.txt enlace_duro.txt

echo "> Vemos que ambos presentan el mismo inodo"
ls -li

# Vemos que tenemos dos enlaces, dos vías de acceso que apuntan a los datos del disco duro.
echo "Info del original"
cat original.txt

echo "Info del enlace"
cat enlace_duro.txt

# Que pasa se borramos?

echo "Borramos el original"
rm original.txt

ls -li
cat enlace_duro.txt

# Vemos que se ha eliminado pero se mantine el enlace duro, con un sólo enlace y el mismo inodo
# El contenido simpre se va a quedar en el disco, siempre y cuando haya un mínimo de 1 enlace ojo!!!

# Enlaces simbólicos --> similares a los enlaces directos de Windows

echo "============================================================================================="

# Ha usado otra vez vim, mira, yo voy a usar nano ok?
nano original.txt
cat original.txt

echo "> creamos el enlace simbólico"
ln -s original.txt enlace_simbólico.txt
echo "Vemos que las diferencias son: el inodo es distinto, sólo presenta un enlace, y el color es azul claro, por defecto se generan todos los permisos, usa una flecha para enseñar en que archivo está la información"
ls -li

# Lo siguiente sería borrar el original.txt para ver cómo reacciona el enlace simbólico
echo "eliminamos original.txt"
rm original.txt
echo "Vemos que ahora el enlace simbólico está en rojo, y no se puede acceder al contenido"
ls -li

# En el output no se ve el color del enlace si lo haces desde el script ahora que me fijo xd, pero
# bueno, se ve igualmente 

# Si volvemos a añadir el archivo, vuelve a funcionar fantásticamente
echo "no se ven colores, pero se copias los comandos en la terminal se ve en azulito de nuevo lo juro xd, es más si corres el script desde el principio lo más seguro es que nunca te enteres de que ha pasado realmnete jajaja"
touch original.txt
ls -li