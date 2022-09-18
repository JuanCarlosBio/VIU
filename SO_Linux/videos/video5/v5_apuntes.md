# Apuntes del vídeo 5: Comandos para el manejo de archivos.

## **Hoy hemos trabajado simplemente desde la terminal, con lo cual, básicamente pondré por aquí el script y el output de este.**

### **INPUT**

```
#!/usr/bin/env bash

ls -lh

echo "============================================================="

# Comando file para ver los tipos de archivos. El código ASCII, visualiza archivos
#  de texto. .fasta se utiliza para representar secuencias de proteínas y nucleotídicas 
# por ejemplo. 

echo "> Vemos los fipos de ficheros"
file *

echo "============================================================="

# Comandos para mostrar los contenidos de los archivos. 
echo "> Vemos el ejemplo de la secuencia de ADN"
cat sample.fasta
# En vez de ver todo, podemos contar palabras, ver líneas...

echo "> Contamos las líneas de sample.fasta"

wc -l sample.fasta

echo "> Contamos el nº de palabras del ahivo anterior"

wc -w sample.fasta

echo "============================================================="

#### Repite lo mismo pero con otro ejemplo, yo no lo tengo.La idea es ver distintos 
# comandos para ver los archivos largos por partes. voy a ver uno de mis queridos 
# archivos de briófitos.

# Con cat es muy difícil ver el archivo
# cat /mnt/c/Users/jcge9/Desktop/asignaturas_VIU/SO_Linux/videos/video3/Base2briofitos/Crossocalyx_hellerianus_global.txt

# Usaremos otros comandos, los voy a comentar una vez los use, los descomentaré si lo
# queiro volver a ver 
echo "> Comando more se va para abajo con enter"
# more /mnt/c/Users/jcge9/Desktop/asignaturas_VIU/SO_Linux/videos/video3/Base2briofitos/Crossocalyx_hellerianus_global.txt
echo "> Comando less se va para abajo con las flechas del teclado"
# less /mnt/c/Users/jcge9/Desktop/asignaturas_VIU/SO_Linux/videos/video3/Base2briofitos/Crossocalyx_hellerianus_global.txt

echo "============================================================="

# Ver el principio y el final
echo "> head nos muestra las primeras 10 líneas del archivo, con -n elegimos el número de líneas, printeamos las tres primeras línea"
head -n 3 sample.fasta # sólo tengo 1 xd

echo "============================================================="

# Lo siguente que hace es ver una base de datos de una serie de genes que se han sobreexpresados
# yo como no gozo de esa base, voy a tomar los datos de mi amigo brófito: Amphidium mougeotii

## Con esto creamos una base de datos con los individuos de Amphidium mougeotii

# cut -f1 /mnt/c/Users/jcge9/Desktop/asignaturas_VIU/SO_Linux/videos/video3/Base2briofitos/Amphidium_mougeotii.txt > individuos_briofito.txt

echo "> Hemos creado una base de datos sólo con los individuos del briofito anterior y hacemos una copia para compararlos si hiciera falta"
ls -l

## Además lo he copiado en una copia_briofitos.txt, por que me suena que los vamos a comparar

# cp individuos_briofito.txt copia_briofitos.txt

echo "============================================================="

# A los individuos de briofitos los vamos a ordenar alfabéticamente 

echo "> Individuos de briófitos ordenados alfabéticamente"
sort individuos_briofito.txt

echo "Ordenarlos de forma inversa"
sort -R individuos_briofito.txt

# Pasarlo a otro archivo de salida, ya me adelanté con cut con lo cual no lo voy a hacer pero lo
# copio aquí comentado.

# sort individuos_briofito.txt > individuos_briofito_ordenados.txt

echo "============================================================="

# Vamos a juntar los individuos de briófitos con la copia. Para eso unimos línea a línea los archivos. 
# Separándose por tabuladores. Vale, esto no es para ver las diferencias, si no para ponerlos en un
# único archivo.

sort -R copia_briofitos.txt > inverso_copia.txt ; paste individuos_briofito.txt inverso_copia.txt
echo "> Ambos archivos han sido fucionados he invertido la copia, para que sean todos diferentes, me parece complicarlo un poquillo para que no sea tan fácil"

# Podemos especificar el delimitador a fucionar con -d y entre comillas, lo comento abajo

# paste -d ";" individuos_briofito.txt inverso_copia.txt

# Comando diff nos comparará los comandos línea a línea

echo "> Obviamente en este caso no van a haber ninguna diferencia"
diff -y individuos_briofito.txt copia_briofitos.txt 

echo "> En el caso de invertir la copia, todos difieren, ocurre algo raro que no entiendo muy bien xd, parece que se generan espacios entre líneas o algo así, pero bueno, algunos son iguales, con lo cual sirve para enterarse de cómo va la movida"
diff -y individuos_briofito.txt inverso_copia.txt 

echo "============================================================="

# Lo siguiente es separar los campos de interés, partes separados por el tabulador, columnas de 
# toda la vida, vectores para in friki de R como yo. Ah, esto ya lo hice para conseguir los individuos
# del briófito xd.

echo "> Voy a extraer los locusde A.mougeotii y voy a llamar al archivo <locus_A_mougeotii.txt>" 

cut -f4-6 /mnt/c/Users/jcge9/Desktop/asignaturas_VIU/SO_Linux/videos/video3/Base2briofitos/Amphidium_mougeotii.txt > locus_A_mougeotii.txt

ls 

# También puedo separar los carácteres. lo hacemos con cut -c

echo "> Vamos a obtener el primer carácter de los nombres de individuos de A.mougeotii"

cut -c1 individuos_briofito.txt

echo "> NICE, Se acabó por hoy"
```

### **Output**

```
total 28K
-rwxrwxrwx 1 juancarlos juancarlos  756 Sep 17 18:28 copia_briofitos.txt
-rwxrwxrwx 1 juancarlos juancarlos  756 Sep 17 18:26 individuos_briofito.txt
-rwxrwxrwx 1 juancarlos juancarlos  756 Sep 17 19:06 inverso_copia.txt
-rwxrwxrwx 1 juancarlos juancarlos 1.1K Sep 17 19:06 locus_A_mougeotii.txt
-rwxrwxrwx 1 juancarlos juancarlos  700 Sep 17 16:58 sample.fasta
-rwxrwxrwx 1 juancarlos juancarlos   64 Sep 17 16:48 v5_apuntes.md
-rwxrwxrwx 1 juancarlos juancarlos 5.1K Sep 17 19:06 v5_comandos_bash
=============================================================
> Vemos los fipos de ficheros
copia_briofitos.txt:     ASCII text
individuos_briofito.txt: ASCII text
inverso_copia.txt:       ASCII text
locus_A_mougeotii.txt:   ASCII text, with CRLF, LF line terminators
sample.fasta:            ASCII text
v5_apuntes.md:           Unicode text, UTF-8 text
v5_comandos_bash:        Bourne-Again shell script, Unicode text, UTF-8 text executable
=============================================================
> Vemos el ejemplo de la secuencia de ADN
Please note that only first ten lines of the file is displayed.

>Genoma_CpI19_Refinada_v2
GTGTCGGAGGCTCCATCGACATGGAACGAGCGGTGGCAAGAAGTTACTAATGAGCTGCTG
TCACAGTCTCAGGACCCGGAAAGTGGTATTTCCATTACGCGACAGCAAAGCGCCTACCTG
CGTCTGGTTAAACCAGTTGCTTTTGTAGAGGGTATTGCCGTTTTAAGCGTTCCTCACGCC
CGAGCGAAAAAAGAGATTGAAACTACGCTGGGACCTGTTATCACAGAGGTATTGTCTCGT
AGACTAGGTCGACAATACAGTCTTGCAGTGAGCGTTCATGCTCCAGAGGAAAATCCAGAA
GTATCCTCGGCCACTCCAGATGCTGTGTCTTATTACCAGGAACAATCTGCAGTTTCTGGA
CAATACGGAGCAACTTCAGCCAATGCTGACTTCCAGAATCAACAAAGCACGATATATCGC
AAGCCACAGGAGTCGCAGTATCCTGTGACTTTTGGTGCTTCTTCATACGGAAATGAGAAG
TACCAGGAAAATTCCCAAGACCAGGGCATTTCTCATCATCCTTATGGTTTTAATGAGGCT
CAACGCATTGCTTCATCTGCCTCTCATGCTGTTCCGCAAAGTGGTTCTGAGCTACTGCAC> Contamos las líneas de sample.fasta
12 sample.fasta
> Contamos el nº de palabras del ahivo anterior
23 sample.fasta
=============================================================
> Comando more se va para abajo con enter
> Comando less se va para abajo con las flechas del teclado
=============================================================
> head nos muestra las primeras 10 líneas del archivo, con -n elegimos el número de líneas, printeamos las tres primeras línea
Please note that only first ten lines of the file is displayed.

>Genoma_CpI19_Refinada_v2
=============================================================
> Hemos creado una base de datos sólo con los individuos del briofito anterior y hacemos una copia para compararlos si hiciera falta
total 28
-rwxrwxrwx 1 juancarlos juancarlos  756 Sep 17 18:28 copia_briofitos.txt
-rwxrwxrwx 1 juancarlos juancarlos  756 Sep 17 18:26 individuos_briofito.txt
-rwxrwxrwx 1 juancarlos juancarlos  756 Sep 17 19:06 inverso_copia.txt
-rwxrwxrwx 1 juancarlos juancarlos 1046 Sep 17 19:06 locus_A_mougeotii.txt
-rwxrwxrwx 1 juancarlos juancarlos  700 Sep 17 16:58 sample.fasta
-rwxrwxrwx 1 juancarlos juancarlos   64 Sep 17 16:48 v5_apuntes.md
-rwxrwxrwx 1 juancarlos juancarlos 5135 Sep 17 19:06 v5_comandos_bash
=============================================================
> Individuos de briófitos ordenados alfabéticamente

AL12
AL19
AL33
AL34
AL36
AL37
AL42
AL43
AL5
AL51
AL53
AL59
AL7
AL73
AM1
AM10
AM100
AM101
AM102
AM103
AM105
AM106
AM107
AM11
AM110
AM111
AM112
AM113
AM114
AM115
AM116
AM117
AM119
AM12
AM121
AM122
AM124
AM128
AM129
AM13
AM131
AM133
AM135
AM137
AM14
AM142
AM145
AM15
AM159
AM161
AM162
AM164
AM165
AM166
AM167
AM168
AM169
AM17
AM170
AM171
AM172
AM175
AM177
AM178
AM179
AM18
AM182
AM20
AM21
AM22
AM23
AM25
AM26
AM28
AM29
AM3
AM31
AM35
AM37
AM38
AM39
AM4
AM40
AM42
AM43
AM44
AM45
AM46
AM47
AM48
AM49
AM5
AM50
AM51
AM52
AM53
AM54
AM55
AM56
AM57
AM58
AM59
AM6
AM60
AM61
AM62
AM63
AM64
AM65
AM66
AM67
AM68
AM69
AM7
AM70
AM71
AM72
AM75
AM76
AM77
AM78
AM79
AM8
AM80
AM81
AM82
AM83
AM84
AM85
AM86
AM87
AM88
AM9
AM91
AM92
AM93
AM94
AM95
AM96
AM97
AM98
AM99
individual
Ordenarlos de forma inversa
AM91
AL59
AM115
AM103
AM78
AM179
AM110
AM96
AM167
AL7
AL5
AM12
AM170
AM8
AM10
AL36
AM64
AM80
AM161
AM25
AM95
AM47
AM50
AM137
AM129
AL42
AM45
AM99
AM63
AM18
AM15
AM131
AL19
AM57
AM171
AM106
AM119
AL53
AM59
AM94
AM107
AM71
AM128
AM111
AM102
AM39
AM178
AM164
AM7
AM133
AM93
AM165
AM6
AL33
AL51
AM168
AM54
individual

AM92
AM112
AM114
AM81
AM124
AM5
AM66
AM87
AM48
AM100
AM28
AM60
AM14
AM105
AM38
AM169
AM17
AM55
AM3
AL37
AM46
AL34
AM121
AM9
AM62
AM65
AM159
AM145
AM135
AM58
AM116
AM51
AL12
AM86
AL43
AM98
AM11
AM22
AM117
AM37
AM67
AM142
AM83
AM113
AM53
AM75
AM31
AM49
AM84
AM4
AM76
AM1
AM52
AL73
AM70
AM61
AM77
AM69
AM68
AM79
AM20
AM40
AM42
AM162
AM166
AM177
AM35
AM43
AM29
AM97
AM13
AM72
AM88
AM85
AM101
AM175
AM122
AM44
AM21
AM182
AM82
AM26
AM172
AM56
AM23
=============================================================
individual      AL5
AL12    AM142
AL19    AM107
AL33    AM79
AL34    AM77
AL36    AM168
AL37    AL59
AL42    AM4
AL43    AM88
AL5     AL36
AL51    AM96
AL53    AM101
AL59    AM86
AL7     AM49
AL73    AM3
AM1     AM52
AM10    AM75
AM100   AM113
AM101   AM110
AM102   AM55
AM103   AL7
AM105   AM133
AM106   AM137
AM107   AM83
AM11    AM20
AM110   AM92
AM111   AM97
AM112   AM38
AM113   AM23
AM114   AM58
AM115   AM99
AM116   AM179
AM117   AM31
AM119   AM18
AM12    AM78
AM121   AM50
AM122   AM22
AM124   AM161
AM128   AM76
AM129   individual
AM13    AM46
AM131   AL19
AM133   AM124
AM135   AM25
AM137   AM167
AM14    AM135
AM142   AM57
AM145   AM169
AM15    AM10
AM159   AM87
AM161   AM35
AM162   AM164
AM164   AM11
AM165   AM91
AM166   AM122
AM167   AM62
AM168   AL12
AM169   AM61
AM17    AM70
AM170   AM68
AM171   AM105
AM172   AM182
AM175   AM5
AM177   AM128
AM178   AL34
AM179   AM51
AM18    AL37
AM182   AM9
AM20    AM69
AM21    AM67
AM22    AM39
AM23    AM13
AM25    AM40
AM26    AM28
AM28    AM172
AM29    AM63
AM3     AM162
AM31    AM37
AM35    AM26
AM37    AM59
AM38    AL43
AM39    AM44
AM4     AM81
AM40    AM119
AM42    AM166
AM43    AM112
AM44    AM170
AM45    AM43
AM46    AM48
AM47    AM106
AM48
AM49    AM65
AM5     AM12
AM50    AM177
AM51    AM129
AM52    AM93
AM53    AM15
AM54    AM85
AM55    AM178
AM56    AM80
AM57    AM102
AM58    AM165
AM59    AM84
AM6     AM111
AM60    AM103
AM61    AM100
AM62    AM115
AM63    AM116
AM64    AM121
AM65    AM29
AM66    AL42
AM67    AM171
AM68    AM53
AM69    AM8
AM7     AM159
AM70    AM82
AM71    AL51
AM72    AM117
AM75    AM47
AM76    AM56
AM77    AM98
AM78    AM7
AM79    AL33
AM8     AM14
AM80    AM71
AM81    AM94
AM82    AM114
AM83    AM6
AM84    AM72
AM85    AM64
AM86    AM131
AM87    AM42
AM88    AM17
AM9     AM45
AM91    AM175
AM92    AM66
AM93    AM145
AM94    AM54
AM95    AM1
AM96    AL73
AM97    AM95
AM98    AM21
AM99    AM60
        AL53
> Ambos archivos han sido fucionados he invertido la copia, para que sean todos diferentes, me parece complicarlo un poquillo para que no sea tan fácil
> Obviamente en este caso no van a haber ninguna diferencia
individual                                                      individual
AL12                                                            AL12
AL19                                                            AL19
AL33                                                            AL33
AL34                                                            AL34
AL36                                                            AL36
AL37                                                            AL37
AL42                                                            AL42
AL43                                                            AL43
AL5                                                             AL5
AL51                                                            AL51
AL53                                                            AL53
AL59                                                            AL59
AL7                                                             AL7
AL73                                                            AL73
AM1                                                             AM1
AM10                                                            AM10
AM100                                                           AM100
AM101                                                           AM101
AM102                                                           AM102
AM103                                                           AM103
AM105                                                           AM105
AM106                                                           AM106
AM107                                                           AM107
AM11                                                            AM11
AM110                                                           AM110
AM111                                                           AM111
AM112                                                           AM112
AM113                                                           AM113
AM114                                                           AM114
AM115                                                           AM115
AM116                                                           AM116
AM117                                                           AM117
AM119                                                           AM119
AM12                                                            AM12
AM121                                                           AM121
AM122                                                           AM122
AM124                                                           AM124
AM128                                                           AM128
AM129                                                           AM129
AM13                                                            AM13
AM131                                                           AM131
AM133                                                           AM133
AM135                                                           AM135
AM137                                                           AM137
AM14                                                            AM14
AM142                                                           AM142
AM145                                                           AM145
AM15                                                            AM15
AM159                                                           AM159
AM161                                                           AM161
AM162                                                           AM162
AM164                                                           AM164
AM165                                                           AM165
AM166                                                           AM166
AM167                                                           AM167
AM168                                                           AM168
AM169                                                           AM169
AM17                                                            AM17
AM170                                                           AM170
AM171                                                           AM171
AM172                                                           AM172
AM175                                                           AM175
AM177                                                           AM177
AM178                                                           AM178
AM179                                                           AM179
AM18                                                            AM18
AM182                                                           AM182
AM20                                                            AM20
AM21                                                            AM21
AM22                                                            AM22
AM23                                                            AM23
AM25                                                            AM25
AM26                                                            AM26
AM28                                                            AM28
AM29                                                            AM29
AM3                                                             AM3
AM31                                                            AM31
AM35                                                            AM35
AM37                                                            AM37
AM38                                                            AM38
AM39                                                            AM39
AM4                                                             AM4
AM40                                                            AM40
AM42                                                            AM42
AM43                                                            AM43
AM44                                                            AM44
AM45                                                            AM45
AM46                                                            AM46
AM47                                                            AM47
AM48                                                            AM48
AM49                                                            AM49
AM5                                                             AM5
AM50                                                            AM50
AM51                                                            AM51
AM52                                                            AM52
AM53                                                            AM53
AM54                                                            AM54
AM55                                                            AM55
AM56                                                            AM56
AM57                                                            AM57
AM58                                                            AM58
AM59                                                            AM59
AM6                                                             AM6
AM60                                                            AM60
AM61                                                            AM61
AM62                                                            AM62
AM63                                                            AM63
AM64                                                            AM64
AM65                                                            AM65
AM66                                                            AM66
AM67                                                            AM67
AM68                                                            AM68
AM69                                                            AM69
AM7                                                             AM7
AM70                                                            AM70
AM71                                                            AM71
AM72                                                            AM72
AM75                                                            AM75
AM76                                                            AM76
AM77                                                            AM77
AM78                                                            AM78
AM79                                                            AM79
AM8                                                             AM8
AM80                                                            AM80
AM81                                                            AM81
AM82                                                            AM82
AM83                                                            AM83
AM84                                                            AM84
AM85                                                            AM85
AM86                                                            AM86
AM87                                                            AM87
AM88                                                            AM88
AM9                                                             AM9
AM91                                                            AM91
AM92                                                            AM92
AM93                                                            AM93
AM94                                                            AM94
AM95                                                            AM95
AM96                                                            AM96
AM97                                                            AM97
AM98                                                            AM98
AM99                                                            AM99

> En el caso de invertir la copia, todos difieren, ocurre algo raro que no entiendo muy bien xd, parece que se generan espacios entre líneas o algo así, pero bueno, algunos son iguales, con lo cual sirve para enterarse de cómo va la movida
individual                                                    <
AL12                                                          <
AL19                                                          <
AL33                                                          <
AL34                                                          <
AL36                                                          <
AL37                                                          <
AL42                                                          <
AL43                                                          <
AL5                                                             AL5
AL51                                                          | AM142
AL53                                                          | AM107
                                                              > AM79
                                                              > AM77
                                                              > AM168
AL59                                                            AL59
AL7                                                           | AM4
AL73                                                          | AM88
AM1                                                           | AL36
AM10                                                          | AM96
AM100                                                         <
AM101                                                           AM101
AM102                                                         | AM86
AM103                                                         | AM49
AM105                                                         | AM3
AM106                                                         | AM52
AM107                                                         | AM75
AM11                                                          <
AM110                                                         <
AM111                                                         <
AM112                                                         <
AM113                                                           AM113
AM114                                                         | AM110
AM115                                                         | AM55
AM116                                                         | AL7
AM117                                                         <
AM119                                                         <
AM12                                                          <
AM121                                                         <
AM122                                                         <
AM124                                                         <
AM128                                                         <
AM129                                                         <
AM13                                                          <
AM131                                                         <
AM133                                                           AM133
AM135                                                         <
AM137                                                           AM137
AM14                                                          | AM83
AM142                                                         | AM20
AM145                                                         | AM92
AM15                                                          | AM97
AM159                                                         | AM38
AM161                                                         | AM23
AM162                                                         | AM58
AM164                                                         | AM99
AM165                                                         <
AM166                                                         <
AM167                                                         <
AM168                                                         <
AM169                                                         <
AM17                                                          <
AM170                                                         <
AM171                                                         <
AM172                                                         <
AM175                                                         <
AM177                                                         <
AM178                                                         <
AM179                                                           AM179
                                                              > AM31
AM18                                                            AM18
AM182                                                         | AM78
AM20                                                          | AM50
AM21                                                          <
AM22                                                            AM22
AM23                                                          | AM161
                                                              > AM76
                                                              > individual
                                                              > AM46
                                                              > AL19
                                                              > AM124
AM25                                                            AM25
AM26                                                          | AM167
AM28                                                          | AM135
AM29                                                          | AM57
AM3                                                           | AM169
AM31                                                          | AM10
                                                              > AM87
AM35                                                            AM35
AM37                                                          | AM164
AM38                                                          | AM11
                                                              > AM91
                                                              > AM122
                                                              > AM62
                                                              > AL12
                                                              > AM61
                                                              > AM70
                                                              > AM68
                                                              > AM105
                                                              > AM182
                                                              > AM5
                                                              > AM128
                                                              > AL34
                                                              > AM51
                                                              > AL37
                                                              > AM9
                                                              > AM69
                                                              > AM67
AM39                                                            AM39
AM4                                                           | AM13
AM40                                                            AM40
AM42                                                          | AM28
AM43                                                          | AM172
                                                              > AM63
                                                              > AM162
                                                              > AM37
                                                              > AM26
                                                              > AM59
                                                              > AL43
AM44                                                            AM44
AM45                                                          | AM81
AM46                                                          | AM119
AM47                                                          | AM166
                                                              > AM112
                                                              > AM170
                                                              > AM43
AM48                                                            AM48
AM49                                                          | AM106
AM5                                                           |
AM50                                                          | AM65
AM51                                                          | AM12
AM52                                                          | AM177
                                                              > AM129
                                                              > AM93
                                                              > AM15
                                                              > AM85
                                                              > AM178
                                                              > AM80
                                                              > AM102
                                                              > AM165
                                                              > AM84
                                                              > AM111
                                                              > AM103
                                                              > AM100
                                                              > AM115
                                                              > AM116
                                                              > AM121
                                                              > AM29
                                                              > AL42
                                                              > AM171
AM53                                                            AM53
AM54                                                          | AM8
AM55                                                          | AM159
                                                              > AM82
                                                              > AL51
                                                              > AM117
                                                              > AM47
AM56                                                            AM56
AM57                                                          | AM98
AM58                                                          <
AM59                                                          <
AM6                                                           <
AM60                                                          <
AM61                                                          <
AM62                                                          <
AM63                                                          <
AM64                                                          <
AM65                                                          <
AM66                                                          <
AM67                                                          <
AM68                                                          <
AM69                                                          <
AM7                                                             AM7
AM70                                                          | AL33
                                                              > AM14
AM71                                                            AM71
AM72                                                          <
AM75                                                          <
AM76                                                          <
AM77                                                          <
AM78                                                          <
AM79                                                          <
AM8                                                           <
AM80                                                          <
AM81                                                          <
AM82                                                          <
AM83                                                          <
AM84                                                          <
AM85                                                          <
AM86                                                          <
AM87                                                          <
AM88                                                          <
AM9                                                           <
AM91                                                          <
AM92                                                          <
AM93                                                          <
AM94                                                            AM94
                                                              > AM114
                                                              > AM6
                                                              > AM72
                                                              > AM64
                                                              > AM131
                                                              > AM42
                                                              > AM17
                                                              > AM45
                                                              > AM175
                                                              > AM66
                                                              > AM145
                                                              > AM54
                                                              > AM1
                                                              > AL73
AM95                                                            AM95
AM96                                                          | AM21
AM97                                                          | AM60
AM98                                                          | AL53
AM99                                                          <
                                                              <
=============================================================
> Voy a extraer los locusde A.mougeotii y voy a llamar al archivo <locus_A_mougeotii.txt>
copia_briofitos.txt      inverso_copia.txt      sample.fasta   v5_comandos_bash
individuos_briofito.txt  locus_A_mougeotii.txt  v5_apuntes.md
> Vamos a obtener el primer carácter de los nombres de individuos de A.mougeotii
i
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A
A

> NICE, Se acabó por hoy
```

