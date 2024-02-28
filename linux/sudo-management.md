# Administración de super usuarios sudo

Los super usuarios son usuarios que con el prefijo sudo pueden hacer acciones directamente desde el usuario root temporalmente. Estos tienen los mismos poderes que el usuario root por lo que se debe gestionar de manera correcta para evitar potenciales riesgos de seguridad del sistema.


## Gestionando usuario sudo.

Para gestionar los usuarios `sudo` usamos el comando `visudo`. El comando visudo permite modificar un fichero temporal que contiene el contenido del fichero /etc/sudoers. Tras guardar, el comando verifica si el fichero no tiene errores y si pasa las validaciones, almacena lo que hayamos modificado. 

Esto se maneja de esta forma debido a que si modificamos el fichero directamente sin realizar ninguna comprobación, podemos dañar el funcionamiento del comando sudo y sin este comando, perdemos los accesos como administrador del sistema. Y enciertos casos, dañariamos el sistema.

Cuando modificas el fichero /etc/sudoers con el comando `visudo`, veremos lineas de configuración como las siguientes:

``` /etc/sudoers.tmp
<%usuario | usuario> ALL=(ALL:ALL) ALL
```

- La primera columna indica el usuario al cual le queremos conceder los permisos. Indicando un `%` al principio, podemos indicar si queremos asignar las reglas a un grupo en concreto.
- La segunda columna indica que hostname es el cual la regla se va a declarar. Esto en el caso de que el fichero contenga la configuración compartida para distintos usuarios. Podemos indicar `ALL` para todos los hostnames o indicar alguno en concreto.
- En la segunda columna seguido del `=` veremos algo similar a (ALL:ALL) el cual tiene el siguiente significado:
	- El primer campo, indica a que usuarios se le puede aplicar sudo. Por lo que `ALL` indica que podemos acceder a cualquier usuario, aunque esto se puede especificar.
	- El segundo campo indica el grupo al cual podemos hacer sudo siendo `ALL` permitiendo acceso a todos los grupos.
- La última columna indica que comandos podemos ejecutar como sudo. Siendo `ALL` todos los comandos. Pero podemos indicar mediante el path del comando, aquellos comandos que queremos permitir que se ejecuten. En esta columna podemos pasar separados por `,` auqellas rutas de los comandos permitidos en el caos que se desee.
	- Podemos pasar `NOPASSWD: <comandos>` para indicar aquellos comandos que no necesitan necesariamente contraseña. Esto es útil para cuando queremos ejecutar programas que necesiten de elevación de privilegios pero siempre y cuando nosotros sepamos que privilegios se estan elevando y porqué. En cualquier otro caso, no se recomienda tener activado `NOPASSWD` para evitar problemas de seguridad.

### Fichero de configuración personalizado

En el fichero /etc/sudoers, al final del fichero podemos encontrarnos con una linéa silimar a la siguiente:

``` /etc/sudoers
@includedir /etc/sudoers.d
```

Esta línea indica que podemos mediante el comando visudo pasarle una ruta especifica que contenga una extensión del fichero en cuestión. Por lo que si por seguridad, no queremos modificar el fichero `/etc/sudoers` por seguridad, podemos indicar en el comando lo siguiente: `visudo /etc/sudoers/<usuario>`. De esta forma estaríamos creando un fichero aparte que ayudaría a mejorar la integridad del sistema en caso de que algo falle.

## Manejando sudo

Por defecto, sudo se mantiene activado por 15 minutos después de habernos pedido la contraseña, también podemos tener ciertos comportamientos con las siguientes flags:

-k: Desactiva sudo de la sesión actual.
-s: Inicializa una nueva shell con el usuario root.

-u <usuario> <comando>: Este comando permite ejecutar comandos en nombre del usuario especificado. Esto es diferente a usar `su <usuarioz>` debido a que este lo que hace es ejecutar un comando dentro del scope del usuario que ha ejecutado en principio `sudo -u <usuario> ...`. La principal diferencia entre usar esto y `su <usuario>` es que si el usuario al que deseas usar tiene scripts personalizados y configuraciones de entorno, estos no se ejecutan. En cambio con `su ...` si ejecuta toda la configuración de inicio de sesión dependiendo de como lo tenga configurado el usuario.

-s: Junto a la flag -s inicializa una nueva shell con el usuario especificado. Si no se especifica ningún usuario, inicializa la shell con el usuario root.
