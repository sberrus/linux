# User management

En esta sección veremos como manejar los usuarios, los permisos, los grupos entre otras cosas.

Hay que tomar en cuenta que los sistemas Mac manejan los usuarios de forma diferente a Unix.

## Tipos de usuarios

root user: basicamente dios. Puede hacer lo que quiera en el sistema.

Regular users: Es un usuario que tiene accesos a ciertas partes del sistema, podemos concederle permisos de super usuario mediante sudo.

Service Users: Son usuarios que definimos para poder manejar servidores web, bases de datos etre otras cosas. Estos son especiales porque buscamos a que de manera isolada, solo puedan acceder a los sistemas que les concedamos permiso.

## Añadir usuarios

Para añadir usuarios utilizamos el comando `useradd` con este comando creamos un usuario a secas, si queremos asignarle ciertos valores como el directorio $HOME, información, shell etc... utilizaremos los siguientes parámetros.

-m: Crea el directorio home del usuario.
-d: Crea un directorio home con una ruta personalizada. En el caso de que no queramos que se almacene en /home/...
-s: Definimos la shell predeterminada del usuario. De forma predeterminada se le asigna /bin/sh.
---
-g: Asigna un grupo primario personalizado.
-G: Asigna grupos secundarios.

## Información de los usuarios

En la ruta /etc/passwd, podemos ver la información de los usuarios como en el siguiente ejemplo:

```
samdev:x:1000:1000:,,,:/home/samdev:/bin/bash
```
Vemos que separados por `:` tenemos lo siguiente:

username:<contraseña>:userid:groupid:<campos_GECO>:$HOME:pred_shell

. El campo GECO es un campo de información adicional los cuales suelen ser campos como direccion, telefono, compañia etc...

En la ruta /etc/shadow se almacenan las contraseñas que por motivos de seguridad se encuentran encriptados para aumentar la seguridad. Solo puede acceder a esta el usuario root o algún usuario con permisos de sudo.

### Modificar información de los usuarios

Para modificar información de los usuarios usamos el comando `usermod` y mediante parámetros, podemos modificar la información de los usuarios.

Los parámetos más importantes son los siguientes:

-c: Permite cambiar el nombre del usuario, solo en la descripción.
-s: Cambia la shell por defecto del usuario.
---
-d: Cambia la ruta del directorio $HOME del usuario. *
-l: Cambia el nombre de usuario. *
* Debemos usar estos parámetros con cautela debido a que puede hacer que ciertos programas o scripts que usen rutas absolutas fallen debido a problemas con el acceso a la ruta de $HOME del usuario o si realiza ciertas validaciones dentro del script relacionadas con el nombre de usuario.

## Eliminar usuarios

Para eliminar los usuarios usamos el comando `userdel` con ciertos parámetros para definir ciertos comportamientos.

Los parámetros son los siguientes:

-r: Elimina el directorio home y los correos.
-f: Elimina el directorio home y los correos, además fuerza el logoff del usuario y dependiendo de la configuración del sistema, elimina también el grupo con el mismo nombre que el del usuario.

## Grupos 

Los grupos son una forma que tenemos de asignar una serie de reglas para todos los usuarios integrantes de ese grupo. Los usuarios pueden formar parte desde ninguno a ilimitada cantidad de grupos.


## Información de los grupos

Para ver la información de los grupos tenemos el archivo /etc/group.

Para modificar el grupo de un usuario usamos el comando `usermod` con las siguientes parámetros:

-g: Cambia el grupo principal del usuario. *suele ser el mismo nombre de usuario*
-G: Cambia los grupos secundarios del usuario.
-aG: Añade un nuevo grupo al usuario sin modificar los existentes.

## INFORMACION IMPORTANTE

Para agregar o eliminar tanto usuarios como grupos, no debemos modificar directamente estos archivos ya que podrían generar errores que el sistema no esta preparado para manejar. Estos archivos son de solo lectura, para realiar tareas de añadir o eliminar, hay comandos que nos permiten hacerlo además de preparar el resto del sistema para que este no falle.

## Cambiar entre usuarios dentro de la consola

Para cambiar de usuarios usamos el comando `su <usuario>`. Si usamos el comando `su` sin especificar usuario se intentará logear al usuario root.

Por defecto el usuario root no tiene contraseña por lo que deberemos asignarle una con el comando `passwd`. Esto no se recomienda por seguridad.

Para quitarle nuevamente la contraseña al usuario root usamos el comando `passwd -dl` de esta forma quitamos la contraseña y además bloqueamos el usuario para que sea inaccesible.
