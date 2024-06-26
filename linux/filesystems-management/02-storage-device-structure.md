# Estructura de un dispositivo de almacenamiento DA's

En esta sección nos vamos a enfocar en el manejo de dispostiivos de tipo HDD, SDD, USB omitiendo otra clase de dispositivos que se usaban en la antigüedad.

Los dispositivos de almacenamiento son dispositivos que nos permiten almacenar bits de manera persistente para poder recuperarlos en un futuro, modificarlos o eliminarlos siempre que sea necesario. Para ello, internamente tiene ciertos aspectos como los siguientes:

## Partition table

Las particiones son una forma de poder separar espacio dentro de un DA para poder tener aislados ciertos bits de otros para que tengan un dominio diferente; por lo que las tablas de partición permiten definir que espacios van a ser definidos y sus capacidades, formatos etc. De los formatos de partición tenemos 2 tipos:

- MBR (Master Boot Record): Es el tipo de partición más antiguo que se conoce, esta limitado a un máximo de 4 particiones primarias y a un máximo de 2TiB de información por disco.
- GPT (GUID Partition Table): Estos son el formato actual y moderno de particiones de disco, permiten tener hasta 128 particiones simultaneas y discos de muchisima más capacidad.

Para ver la inforamación de los discos que tenemos en nuestros dispositivo conectados podemos hacer uso del comando `gparted`. Con este comando podemos tener una GUI la cual nos muestra información de los dispositivos que tenemos disponibles y su inforamación.
