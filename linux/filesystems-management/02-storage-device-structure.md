# Estructura de un dispositivo de almacenamiento DA's

En esta sección nos vamos a enfocar en el manejo de dispostiivos de tipo HDD, SDD, USB omitiendo otra clase de dispositivos que se usaban en la antigüedad.

Los dispositivos de almacenamiento son dispositivos que nos permiten almacenar bits de manera persistente para poder recuperarlos en un futuro, modificarlos o eliminarlos siempre que sea necesario. Para ello, internamente tiene ciertos aspectos como los siguientes:

## Partition table

Las particiones son una forma de poder separar espacio dentro de un DA para poder tener aislados ciertos bits de otros para que tengan un dominio diferente; por lo que las tablas de partición permiten definir que espacios van a ser definidos y sus capacidades, formatos etc. De los formatos de partición tenemos 2 tipos:

- MBR (Master Boot Record): Es el tipo de partición más antiguo que se conoce, esta limitado a un máximo de 4 particiones primarias y a un máximo de 2TiB de información por disco.
- GPT (GUID Partition Table): Estos son el formato actual y moderno de particiones de disco, permiten tener hasta 128 particiones simultaneas y discos de muchisima más capacidad.

Para ver la inforamación de los discos que tenemos en nuestros dispositivo conectados podemos hacer uso del comando `gparted`. Con este comando podemos tener una GUI la cual nos muestra información de los dispositivos que tenemos disponibles y su inforamación.

## Diferencias entre la nomenclatura de espacios de almacenamiento, medidas de los espacios de almacenamiento

Para esta parte, vamos a crear una partición de 50.000 MiB de almacenamiento que va a ser aproximadamente 48GB, pero ¿porque pasa esto?

Para  ver lo siguiente tenemos que saber lo siguiente:

8 Bit = 1 Byte. Esto es porque al ser sistemas binarios, la unidad de cada byte es 8 bits almacenados.
1 Kibibyte = 1024 Byte (2^10 Byte).
1 Kilobyte = 1000 Byte (10^3 Byte).

La diferencia entre los kilo\* y los kibi\* es que uno es para realizar medidas en sistemas decimales (Kilo\*) y los otros son para sistemas binarios (Kibi\*).

Ya para los 90's, se definio un estandar por el sistema que conocemos actualmente el cual 1Kilobyte representa 1024 bytes, 1 megabyte representa 1024 kilobytes y asi...

## ¿Qué son los filesystems?

Los filesystems son la forma que tiene el sistema de ordenar los directorios y los ficheros. Estos son los responsables de lo siguiente:

- Organización: Se encargan de la organización de los directorios y ficheros.
- Locación de espacios en el disco: Se encargan de asignar el espacio disponible dentro de un DA y de gestionar cuando este ocupa espacio y cuando liberarlo cuando se elimina un fichero por ejemplo.
- Es el encargado de manejar la metadata de los ficheros que se almacenan: Maneja los permisos, los permisos de almacenamiento, los datos de `timestamp` etc...
- Integridad de los datos: El filesystem también maneja la integridad de los datos a traves de mecanismos de detección de errores y de asegurad (dependiendo del tipo de filesystem que se cuente) de que los datos se mantengan persistentes aún así haya un corte de electricidad repentino, algunos fiulesystems estan preparados para estos casos e intentan en la medida de lo posible de mantener la información a salvo incluso si hay un apagado inesperado o un corte directo de energia en el sistema.

### Tipos de filesystems

En linux tenemos los siguientes:
- ext3 Third extended FS developed: Es antigüo, pero es altamente usado actualmente.
- ext4 Forth version extended FS developed: 
	- Mejora le optimización del sistema
	- Soporte para discos de alto tamaño.
	- Algoritmos de recuperación de datos luego de apagado del sistema.
- xfs: 
	- Especialmente útil para manejar ficheros de gran tamaño.
	- Optimizado para operaciones I/O en paralelo.
	- Soporte para snapshots, los ficheros puede compartir los mismos bloques de datos simultaneamente.
- btrfs:
	- Soporte para manejar ficheros usando snapshots de manera sencilla. A nivel de sistema, cada vez que se modifica un fichero, se crea una copia del mismo, esto permite que se puedan crear snapshots de los ficheros que se esten manejando y poder manejar más fácilmente la concurrencia.
	- Suele ser utilizado en los RAID's por estas ventajas.

En Windows, solemos tener formatos como los siguientes:
- FAT32: 
	- Esta limitado para ficheros de máximo 4GB de datos.
- NTFS: Propietario, es usado para que sea leído por sistemas Linux y poder compartir datos fácilmente entre sistemas.
- ReFS: Sucesor de NTFS.
- exFAT: Propietario hasta 2019. Ahora publicado y usado principalmente para dispositivos externos como memorias de camaras o dispositvos USB.

En MAC tenemos lo siguiente (APFS):
Es el sistema principal para IOS y macOS. Este sistema soporta encriptación del disco entero, dando una capa de seguridad extra.

