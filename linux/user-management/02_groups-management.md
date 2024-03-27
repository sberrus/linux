# Administración de grupos

Los grupos nos permiten crear reglas las cuales van a poder ser concedidas a todos los usuarios pertenecientes a ese grupo.

Las ventajas que tienen los grupos es que podemos asignarles ciertos permisos para que podemos garantizar que ciertos usuarios tengan acceso a ciertos recursos en vez de a otros. 

Podemos crear usuarios que solo puedan acceder y manejar a directorios y ficheros que nosotros definamos entre otras cosas.

Es un concepto importante sobre todo para garantizar la seguridad del sistema.

## Grupo primario

Cada usuario tiene de forma predeterminada un grupo principal. Este grupo es el encargado de que en el momento en el que ese usuario crea un fichero, predeterminadamente el usuario es el que tiene acceso a dicho fichero y por ende podemos asignarle permisos al mismo. Este se ve reflejado en el fichero /etc/passwd, en este fichero podemos ver el ID del grupo que coincide con el ID del grupo que aparece en el fichero /etc/group.

Cuando se crea un fichero, podemos ver con el comando `ls -al` la información relacionada con los permisos del fichero de la siguiente manera.

```
-rw-rw-r-- 1 samdev samdev    0 Feb 27 08:37 file
```
En el log superior podemos ver la siguiente inforamción separado en columnas.

- La primera columna muestra los permisos del fichero.
- La segunda coolumna muestra xxx
- La tercera columna muestra el usuario que ha creado el fichero. 
- La cuarta columna muestra a que grupo pertenece el fichero.
Y el resto de columnas muestran información de metadata como al fecha que ha sido creado, la hora que ha sido modificado por última vez, el nombre del fichero.

## Grupos secundarios

Los grupos secundarios son grupos son los grupos que podemos crear manualmente y podemos definir los permisos que necesitemos.

Estos grupos pueden contener todos los usuarios que sean necesarios.

Estos también se almacenan en el fichero /etc/group, cuando accedemos al fichero, podemos ver que usuarios pertenecen a que grupos al final de la linea. También tenemos un comando `groups` el cual pasandole un usuario o una lista de usuarios, podemos ver los permisos de los usuarios que pasemos como argumento.

## Grupos preexistentes en los sistemas Ubuntu.

- root: Este grupo es el encargado de conceder los permisos de superusuario y da completo acceso al sistema. Si es cierto que podemos añadir a otros usuarios a este grupo, por seguridad se recomienda no añadir ningún usuario exceptuando al usuario root a dicho grupo.
- sudo / whell: Concede permisos de sudo a los usuarios. En otros subsystems se le suele llamar también wheel.
- adm: Concede permisos de lectura a ficheros logs del sistema.
- lp / lpadmin: Concede permisos de uso de impresoras.
- www-data: Concede permisos para poder interactuar con sistemas de servidores web como apache o Nginx, concede acceso al contenido web servido.
- plugdev: Concede permisos para poder interactuar con hardware externo extraible como usb, memorias externas etc...

## Manejar los grupos de los usuarios

Para manejar los grupos de los usuarios podemos hacer uso del comando `usermod` con los siguientes parámetros:

-g: Modificamos grupo primario.
-G: Modificamos grupos secundarios. Para asignarle los nuevos grupos se los pasamos separados por `,`.
-aG: Añadimos nuevo grupo sin modificar los anteriores. Podemos pasarle uno a uno o también podemos pasarle los grupos separados por `,` en el caso de querer asignarle varios a la vez.

Para eliminar un grupo de un usuario, lo podemos hacer mediante el comando `usermod -G` pasando como argumento todos los grupos exceptuando aquel que queramos quitar de dicho usuario. Hasta los momentos no hay de forma predeterminada por el sistema una forma más sencilla de eliminar un grupo en concreto a un usuario.

En algunos sistemas hay 2 comandos que nos permiten tanto añadir como eliminar grupos de manera más sencilla siendo `adduser <user> <group>` `deluser <user> <group>`.

## Manejo de los grupos

### Crear grupo

Para crear un nuevo grupo usamos el comando `groupadd <nombre_grupo>`. Este tiene ciertos parámetros pero el que más nos puede interesar en principio es -g, este parámetro nos permite asignar un GID personalizado al grupo el cual dependiendo de la organización puede ser importante que llevemos una normalización.

### Modificar grupo

Para modificar un grupo, hacemos uso del comando `groupmod <group>` el cual tiene los siguientes parámetros.

-n: Cambia el nombre del grupo.
-g: Cambua el GID del grupo.

Estos cambios al realizarlos con este comando, se actualizan tanto en /etc/group como en /etc/passwd. 

### Eliminar un grupo

Para eliminar un grupo hacemos uso del comando `groupdel <group>`. Es imporante destacar que este comando solo elimina al grupo, no elimina ni los ficheros y nada fuera de esto.

Este comando no funciona con los grupos primarios de los usuarios.
