#!/usr/bin/env bash

#!/usr/bin/env bash

# Este comando lo usaríamos una vez para obtener el segundo script
#firefox https://www.ncbi.nlm.nih.gov/genome/guide/human/ 

#wget -P human_genoma_gh38 https://ftp.ncbi.nlm.nih.gov/refseq/H_sapiens/annotation/GRCh38_latest/refseq_identifiers/GRCh38_latest_genomic.fna.gz

# Las N significan nucleótidos desconocidos.
# head GRCh38_latest_genomic.fna 

# Grep con -v Se salta las líneas de las primeras líneas con ">" (sin el es como filter de R) | contar los pares de bases # (caracteres)
# grep -v ">" GRCh38_latest_genomic.fna | wc -c 

# filtrar TATA
# grep TATA | wc -c # no encuentra nada xd

# firefox --search "microsoft 365"

# Comando del arbol más fancy que ls
# tree

# Nivel 1 de tree (L), si ponemos 2 nos daría el directorio padre y los subdirectorios, si ponemos con la condición la / nos da los directorios desde root, C es para que nos lo devuelva en colores, p nos da los permisos
tree -L 1 / -C -p
