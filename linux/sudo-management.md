# Administración de super usuarios sudo

Los super usuarios son usuarios que con el prefijo sudo pueden hacer acciones directamente desde el usuario root temporalmente. Estos tienen los mismos poderes que el usuario root por lo que se debe gestionar de manera correcta para evitar potenciales riesgos de seguridad del sistema.


## Gestionando usuario sudo.

Para gestionar los usuarios `sudo` usamos el comando `visudo`. El comando visudo permite modificar un fichero temporal que contiene el contenido del fichero /etc/sudoers. Tras guardar, el comando verifica si el fichero no tiene errores y si pasa las validaciones, almacena lo que hayamos modificado. 

Esto se maneja de esta forma debido a que si modificamos el fichero directamente sin realizar ninguna comprobación, podemos dañar el funcionamiento del comando sudo y sin este comando, perdemos los accesos como administrador del sistema. Y enciertos casos, dañariamos el sistema.

## Manejando sudo

Por defecto, sudo se mantiene activado por 
