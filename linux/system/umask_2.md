## Cambiar los permisos predeterminados del sistema

Con el comando `umask` podemos indicar que permisos de forma predeterminada tendrá el sistema a la hora de crear ficheros y directorios.

...
INTRODUCIR RESTO DE LA CLASE AQUÍ
...

Para cambiar la configuarción en todas las sesiones para todos los usuarios dentro de nuestro sistema, modificamos estos valores dentro del fichero /etc/login.defs

En este fichero declaramos configuraciones que vamos a necesitar globales para todos los usuarios del sistema.

Hay que tener en cuenta que el uso de los umask va condicionado por la configuarción de /etc/login.defs. Hay una opción USERGROUPS_ENAB el cual indica que le umaks del grupo principal va a ser el mismo que el umask del dueño.

## sticky bit

Este valor es el que se encarga de definir quienes pueden realizar según que acciones en el sistema.

Este valor es el primer dígito que se encuentra a la hora de ejecutar el comando umask.

Para ficheros, antiguamente se utilizaba para definir si un fichero ejecutable debía mantenerse en memoria para que este sea ejecutado más rápidamente en la siguiente ejecución. Actualmente esta obsoleto este comportamiento.

Para directorios, sin el sticky bit, todos los usuarios con permisos de (w,x) en el directorio, pueden cmabiar el nombre y eliminar ficheros dentro de este. Para evitar que esto ocurra, podemos declarar el sticky bit para que solo el dueño del fichero y el root.

Para declara el sticky bit a un directorio, debemos hacer usod del comando `chmod <stickybit><resto de permisos> <fichero>` por ejemplo: chmod 1777 <fichero> o de manera abreviada como `chmod -t <fichero>`.


