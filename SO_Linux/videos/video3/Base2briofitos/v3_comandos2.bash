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

