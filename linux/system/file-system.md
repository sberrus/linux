# Sistema de fivcheros en linux 

En linux, el concepto de ficheros es bastante mas complejo que en otros sistemas ya que podríamos resumir que todo en linux son ficheros por lo que hay muchos tipos de ficheros.

Veremos que tipos hay, como se organizan, comprender los symbolic links, además de ver potenciales problemas que podemos encontrarnos como por ejemplo que tengamos el espacio de almacenamiento full cuando todavía existe espacio disponible pero no en el "inode" el cual tocaremos lueog.

## ¿Qué es un fichero?
Es un contenedor en el que podemos acceder, manejar y almacenar información. Un fichero tiene un identificador unico el cual combinando el nombre del fichero y su path, obtenemos un identificador unico en el sistema.

Además de la información que almacena tiene otra metadata que utiliza el sistema para asignarle atributos como podrían ser el tamaño (size), los permisos, dominio del fichero, marcas de tiempo (cuando se creo, cuando se ha modificado por última vez, cuando se ha accedido por última vez, quien ha accedido por última vez), etc...

Por lo general, el formato de almacenamiento de los ficheros en linux suele ser EXT aunque puede variar dependiendo del sistema en el cual estes trabajando como podrían ser FAT32 entre otros.

## Inode
Los ficheros contienen un atirbuto llamado inode, este atributo es el encargado de almacenar la metadata del fichero como tipo de fichero, permisos, número de hardlinks, tamaño del archivo entre otros... Suele almacenarse en el disco, pero casos en los que esto no ocurre.

El inode lo tienen tanto los ficheros como los directorios también conteniendo toda esa información. Cabe destacar que para el sistema linux, los directorios también los considera como archivos.

Para detallar un poco más en profundidad. Ya hemos visto que el sistema de ficheros de linux funciona de una forma peculiar. Un fichero tiene un identificador único el cual usamos para poder interactuar con la data que esta almacenada en nuestro disco. Imaginemos un archivo de texto. Cuando creas un fichero no solo creas un fichero sino que estas creando un fichero (con su identificador único), un inode (la metadata) y asignando el espacio en el disco para almacenar los bytes de dicho fichero.

Lo que debemos tener en cuenta es que lo que importa en cierto modo es el Inode ya que este es el encargado de enlazar un fichero, con los bytes que estan almacenados en el disco. Esto es importante porque en linux, podemos tener multiples ficheros que comparten un mismo inode por lo que comparten a su vez, la misma data. 

Los ficheros que comparten el inode son conocidos como Hardlinks, cuando un inode se queda sin hardlinks, el inode se autodestruye y con ella su data.

## Tipos de ficheros

Ya dejamos claro que hay varios tipos de ficheros, estos tipos pueden ser los siguientes:

- ordinary files (-): Típicos archivos de almacenamiento de texto.
- directory files (d): Directorios.
- symbolic links (l): Enlaces
- character divices (c):
- block divices (b): 
- named pipes (p): Estos ficheros permiten que múltiples procesos se comuniquen entre ellos.
- sockets (s): Igual que named pipes

Para saber cual es el tipo de archivo, podemos verlo simplemente con el comando `ls -l [folder/file]`, con esta flag, veremos un output como el siguiente:  `-rw-r--r-- 1 samdev samdev 2190 Feb 21 02:37 file-system.md` siendo el primer caracter de la secuencia `-rw-r--r--` el encargado de mostrar que tipo de archivo es. En este caso podemos ver que el archivo es un `ordinary file` ya que este comienza con un `-`.

### Symbolic link

Este es un tipo espacial de fichero de linux, este crea un enlace para un fichero o un directorio el cual nos sirve para crear un enlace desde un arcivo de destino a otro.

Para crear un symlink usamos el comando `ln -s`.

Al crear un symlink estamos creando un enlace entre ambos archivos por lo que si yo quiero crear un symlink en una ruta x para acceder a un fichero que esta en una ruta y, sin tener que duplicar el archivo, usamos un symlink y esto nos facilita la tarea.

Es importante también destacar que las rutas deben ser absolutas, de lo contrario, los enlaces no funcionarán correctamente.

### Hard link

Los Hardlinks son la forma que tenemos de comunicar un fichero con su Inode por lo que podemos asignar multiples ficheros a un mismo Inode.

Un Hardlink solo puede apuntar a un fichero dentro del mismo filesystem.

Además, el sistema debe soportar el uso de hardlinks

Para crear un hardlink utilizamos el comando `ln` sin la flag `-s`.

Los hardlinks no pueden apuntar a directorios, esto para evitar loops

Podemos copiar un directorio entero como hardlink usando el comando `cp -al <source> <destination>` la flag -al indica al sistema que cree una copia pero que los ficheros internos sean hardlinks.

Esto es realmente útil para cuando queremos tener una copia de los ficheros de un directorio sin que los archivos copiados ocupen espacio nuevo en el disco.

Esto es útil en casos en los que querramos organizar unos ficheros de forma diferente pero no queremos crear una copia per se de los mismos. 

#### ¿Diferencias entre hard y symbolic links?

La principal diferencia entre ambos es su forma de almacenar la información. Los hardlinks en si son copias identicas que apuntan a un mismo inode, por lo que a la práctica son el mismo fichero ya que en sí tienen la misma información solo que pueden estar en distintos directorios. 

Los symlink son útiles para crear enlaces, puntos de acceso comodo a cietos ficheros o directorios. Lo que pasa con los symlinks es que al momento en que la ruta no es alcanzable ej: cuando tenemos un symlink apuntando a una unidad desmontable, cuando esta unidad no se encuentra en el sistema, el symlink se rompe.

La útilidad depende de para que se quiera usar alguna de las soluciones.

## Inode Limit

Todos los inodes se almacenan de manera centralizada, este espacio es especificado en el momento en el que configuramos el filesystem del sistema. Este espacio no puede ser utilziado para ninguna otra cosa.

Para ver cuantos inodes estan siendo usados utilizamos el comando `df -ih`

**El comando df sirve para mostrar información acerca del espacio del sistema. También sirve para saber el tamaño que ocupa un directorio**

Esto nos va a devolver una tabla de discos los cuales muestra los inodes disponibles, los utilizados etc...

Por lo general el inode suele tener suficiente espacio para operar, pero puede pasar que por algún motivo nos quedemos sin espacio de inodes disponibles. Eso hará que lso programas crasheen o que no puedan ser accedidos.

Para solucionar este problema, podemos eliminar varios ficheros antiguos o podemos comprimirlos en un .tar

Otra solución es recrear todo el file system y aumentar el tamaño del inode.

También puedes aumentar el espacio de los inodes mediante una unidad externa.



También puedes aumentar el espacio de los inodes mediante una unidad externa.


