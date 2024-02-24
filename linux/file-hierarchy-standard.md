# Jerarquía de ficheros en linux

La jerarquía es útil para que todas las versiones de sistemas Linux-like. Se refiere a una estandarización a la hora de crear estructuras de ficheros y directorios en linux que ayudan a administradores y programadores a saber donde se encuentran los aspectos y la información de forma más ágil.

Veremos brevemente algunos directorios y su importancia:

- / -> root: Es el directorio raíz del sistema. Desde aquí nacen todos los demas subdirectorios de nuestro sistema.

- /bin -> binaries: Es el directorio que se encarga de almacenar los binarios necesarios para la gestión y el mantenimiento del sistema. En los sistemas actuales, la ruta /bin es un symlink a /usr/bin.

- /boot -> boot folder: Esta directorio es la encargada de configurar el boot del sistema. Es importante para el arranque del sistema.

- /dev -> devices folder: Esta es la directorio de los dispositivos. Mediante esta tenemos ficheros que nos permiten interactuar con los distintos dispotivos.

- /etc -> configurations: Esta es la directorio que se encarga de almacenar los archivos de configuración del sistema y sus programas.

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

- /usr -> Este directorio es especial ya que es el encargado de almacenar los archivos y binarios que necesita el sistema. En los sistemas actuales es el encargado de almacenar todos los binarios, esto despues de adaptar el usrmerge el cual permite tener en un solo lugar toda la inforamación y binarios necesarios para el sistema. 

Antiguamente se tenian el resto de directorios por temas de rendimiento y por las limitaciones que antiguamente tenían los sistemas para  /usr -> Este directorio es especial ya que es el encargado de almacenar los archivos y binarios que necesita el sistema. En los sistemas actuales es el encargado de almacenar todos los binarios, esto despues de adaptar el usrmerge el cual permite tener en un solo lugar toda la inforamación y binarios necesarios para el sistema. 

Antiguamente se tenian el resto de directorios por temas de rendimiento y por las limitaciones que antiguamente tenían los sistemas para almacenar estos binarios. En la actualidad al tener equipos más potentes se implemento el `usrmerge`el cual permitio que todos los binarios se encuentren en la ruta /usr. 

El directorio /usr se suele usar para compartir datos y binarios dentro de una red.

- /usr/local -> A diferencia de /usr, la directorio /usr/local es para binarios que no estan pensados para ser compartidos con otras máquinas. Este es especifico para binarios y datos que sean necesarios para la máquina anfitriona.

- /var -> variable data: Esta directorio es la encargada de almacenar toda la información variable dentro de nuestro sistema. Por lo general es donde se guardan todos los ficheros que los distintos programas tienden a usar para manipular información, es el directorio donde se guardan los archivos de servidores http, las bbdd, etc... 

En el momento de hacer backups del sistema, esta carpeta suele ser de las primordiales que necesitamos para no perder información importante.

- /snap : Las distintas distros de linux tienen diferentes gestores de aplicaciones. En ubuntu es apt, en centOS es dnf, cada uno tiene una manera de instalar y gestionar las instalaciones de los paquetes. 

Esta ruta suele almaceanar también binarios descargados.

- /lost+found: Este directorio se encarga de almacenar información que no ha sido guardada, es una especie de direcotrio backup para cuando el sistema falla y no nos ha dado tiempo de almacenar o guardar la inforamción. 
