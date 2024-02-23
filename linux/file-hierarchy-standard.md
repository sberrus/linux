# Jerarquía de ficheros en linux

La jerarquía es útil para que todas las versiones de sistemas Linux-like. Se refiere a una estandarización a la hora de crear estructuras de ficheros y directorios en linux que ayudan a administradores y programadores a saber donde se encuentran los aspectos y la información de forma más ágil.

Veremos brevemente algunos directorios y su importancia:

- / -> root: Es el directorio raíz del sistema. Desde aquí nacen todos los demas subdirectorios de nuestro sistema.

- /bin -> binaries: Es el directorio que se encarga de almacenar los binarios necesarios para la gestión y el mantenimiento del sistema. En los sistemas actuales, la ruta /bin es un symlink a /usr/bin.

- /boot -> boot folder: Esta carpeta es la encargada de configurar el boot del sistema. Es importante para el arranque del sistema.

- /dev -> devices folder: Esta es la carpeta de los dispositivos. Mediante esta tenemos ficheros que nos permiten interactuar con los distintos dispotivos.

- /etc -> configurations: Esta es la carpeta que se encarga de almacenar los archivos de configuración del sistema y sus programas.

- /home -> directorios de usuarios: Es el directorio en cargado de almacenar los ficheros y directorios de los usuarios del sistema.

- /lib -> libraries folder: Es el directorio encargado de almacenar binarios que son necesarios para que los programas ejecutados en /bin o /sbin ejecuten. Son las librerias que utilizan el resto de binarios. Dependiendo del sistema, podemos encontrarnos con directorios /lib32 /lib34 siendo estos correspondientes a la arquitectura del cpu en le que esta corriendo. En los sistemas actuales, estos directorios son symlinks de /usr/lib.

- /media: Contiene puntos de montaje de perifericos de almacenamiento. Si conectamos un usb o una tarjeta sd mediante sus respectivos puertos, podremos acceder a estos mediante este directorio.

- /mnt: Puntos de acceso de filesystems que no suelen ser extraibles. Por ejemplo discos duros externos o segundos discos se suelen montar en este directorio como buena práctica.

- /opt -> optional packages: Librerias opcionales se suelen dejar en este directorio.

- /proc -> virtual filesystem: Ofrece una serie de ficheros que nos ayudan a realizar tareas de diagnostico del sistema.

- /root -> root folder: Es el directorio del super usuario del sistema.

- /run: Este directorio almacena ficheros los cuales son eliminados al momento en el que se reincia el sistema. Es el encargado de almacenar el run-time data. También podemos ver el tamaño que tiene este directrio con el comando `df -h` en el cual el filesystem podremos ver algo parecido a lo siguiente: `tmpfs ##G  ##G  ##G  ##% /run`

- /sbin -> root bin folder: Es el archivo /bin pero para los programas que son necesarios para el usuario root. También es un symlink a /usr/sbin.

- /srv -> servers directory: Ficheros y dircetorios de servicios, siempre y cuando no estemos almacenando nada en /var. Normalmente son ficheros y directorios que obtenemos mediante FTP.

- /sys -> system information: Ficheros que contienen información importante del sistema y el kernel.

- /tmp -> temporary files: Es similar a /run. Son archivos temporales que son eliminados al momento de reiniciar el sistema.

- 
