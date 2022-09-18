# Vídeo 6 CF Sistemas Operativos Linux: Enlaces duros y enlaces simbólicos

### Concepto de enlace duro y simbólico.

**Todo archivo Linux tiene asociado un número entero único e identificativo.** 

## Esquema de un ***enlace duro***

### Archivo original -> datos en el disco <- enlace_duro

* Si tenemos un archivo original apuntando a unos datos guardados en el disco, un enlace duro es una nueva conexión apuntando a los mismos datos del disco.

* La diferencia es el **nombre entre ellos**

* ***Compartirán el mismo INODO***

## Esquema de un ***enlace simbólico***

### enlace_simbolico -> archivo_original -> datos en el disco

* Es parecido como accesos directos en Windows

* **No apuntan al contenido original del archivo**

* ***Apuntan al archivo que gruarda los datos originales del disco***

### **INPUT**

```
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
```

### **OUTPUT**

```
> Creamos el archivo original.txt
Para verificar que está vacío usamos cat
=============================================================================================
> Con la letra -i obtenemos el número del inodo de cada archivo, además al lado de los permisos nos da el número de en lacestotal 8
123004564822561722 lrwxrwxrwx 1 juancarlos juancarlos   12 Sep 17 20:31 enlace_simbólico.txt -> original.txt
 21955048183966470 -rwxrwxrwx 1 juancarlos juancarlos   10 Sep 17 20:56 original.txt
 68398419340744629 -rwxrwxrwx 1 juancarlos juancarlos  813 Sep 17 20:23 v6_apuntes.md
  9007199254794598 -rwxrwxrwx 1 juancarlos juancarlos 2946 Sep 17 20:55 v6_comandos.bash
> Usamos para ver el stat para ver información adicional del archivo.
  File: original.txt
  Size: 10              Blocks: 0          IO Block: 512    regular file
Device: eh/14d  Inode: 21955048183966470  Links: 1
Access: (0777/-rwxrwxrwx)  Uid: ( 1000/juancarlos)   Gid: ( 1000/juancarlos)
Access: 2022-09-17 20:56:35.270583100 +0100
Modify: 2022-09-17 20:56:35.270583100 +0100
Change: 2022-09-17 20:56:35.270583100 +0100
 Birth: -
=============================================================================================
> Creamos en enlace duro
> Vemos que ambos presentan el mismo inodo
total 8
 21955048183966470 -rwxrwxrwx 2 juancarlos juancarlos   10 Sep 17 20:56 enlace_duro.txt
123004564822561722 lrwxrwxrwx 1 juancarlos juancarlos   12 Sep 17 20:31 enlace_simbólico.txt -> original.txt
 21955048183966470 -rwxrwxrwx 2 juancarlos juancarlos   10 Sep 17 20:56 original.txt
 68398419340744629 -rwxrwxrwx 1 juancarlos juancarlos  813 Sep 17 20:23 v6_apuntes.md
  9007199254794598 -rwxrwxrwx 1 juancarlos juancarlos 2946 Sep 17 20:55 v6_comandos.bash
Info del original
hola hola
Info del enlace
hola hola
Borramos el original
total 8
 21955048183966470 -rwxrwxrwx 1 juancarlos juancarlos   10 Sep 17 20:56 enlace_duro.txt
123004564822561722 lrwxrwxrwx 1 juancarlos juancarlos   12 Sep 17 20:31 enlace_simbólico.txt -> original.txt
 68398419340744629 -rwxrwxrwx 1 juancarlos juancarlos  813 Sep 17 20:23 v6_apuntes.md
  9007199254794598 -rwxrwxrwx 1 juancarlos juancarlos 2946 Sep 17 20:55 v6_comandos.bash
hola hola
=============================================================================================
hola hola amigo
> creamos el enlace simbólico
ln: failed to create symbolic link 'enlace_simbólico.txt': File exists
Vemos que las diferencias son: el inodo es distinto, sólo presenta un enlace, y el color es azul claro, por defecto se generan todos los permisos, usa una flecha para enseñar en que archivo está la información
total 8
 21955048183966470 -rwxrwxrwx 1 juancarlos juancarlos   10 Sep 17 20:56 enlace_duro.txt
123004564822561722 lrwxrwxrwx 1 juancarlos juancarlos   12 Sep 17 20:31 enlace_simbólico.txt -> original.txt
 68679894317778245 -rwxrwxrwx 1 juancarlos juancarlos   16 Sep 17 20:56 original.txt
 68398419340744629 -rwxrwxrwx 1 juancarlos juancarlos  813 Sep 17 20:23 v6_apuntes.md
  9007199254794598 -rwxrwxrwx 1 juancarlos juancarlos 2946 Sep 17 20:55 v6_comandos.bash
eliminamos original.txt
Vemos que ahora el enlace simbólico está en rojo, y no se puede acceder al contenido
total 8
 21955048183966470 -rwxrwxrwx 1 juancarlos juancarlos   10 Sep 17 20:56 enlace_duro.txt
123004564822561722 lrwxrwxrwx 1 juancarlos juancarlos   12 Sep 17 20:31 enlace_simbólico.txt -> original.txt
 68398419340744629 -rwxrwxrwx 1 juancarlos juancarlos  813 Sep 17 20:23 v6_apuntes.md
  9007199254794598 -rwxrwxrwx 1 juancarlos juancarlos 2946 Sep 17 20:55 v6_comandos.bash
no se ven colores, pero se copias los comandos en la terminal se ve en azulito de nuevo lo juro xd, es más si corres el script desde el principio lo más seguro es que nunca te enteres de que ha pasado realmnete jajaja
total 8
 21955048183966470 -rwxrwxrwx 1 juancarlos juancarlos   10 Sep 17 20:56 enlace_duro.txt
123004564822561722 lrwxrwxrwx 1 juancarlos juancarlos   12 Sep 17 20:31 enlace_simbólico.txt -> original.txt
 18295873486402859 -rwxrwxrwx 1 juancarlos juancarlos    0 Sep 17 20:56 original.txt
 68398419340744629 -rwxrwxrwx 1 juancarlos juancarlos  813 Sep 17 20:23 v6_apuntes.md
  9007199254794598 -rwxrwxrwx 1 juancarlos juancarlos 2946 Sep 17 20:55 v6_comandos.bash
```