# User management

En esta sección veremos como manejar los usuarios, los permisos, los grupos entre otras cosas.

Hay que tomar en cuenta que los sistemas Mac manejan los usuarios de forma diferente a Unix.

## Tipos de usuarios

root user: basicamente dios. Puede hacer lo que quiera en el sistema.

Regular users: Es un usuario que tiene accesos a ciertas partes del sistema, podemos concederle permisos de super usuario mediante sudo.

Service Users: Son usuarios que definimos para poder manejar servidores web, bases de datos etre otras cosas. Estos son especiales porque buscamos a que de manera isolada, solo puedan acceder a los sistemas que les concedamos permiso.

## Grupos 

Los grupos son una forma que tenemos de asignar una serie de reglas para todos los usuarios integrantes de ese grupo. Los usuarios pueden formar parte desde ninguno a ilimitada cantidad de grupos.

## Información de los usuarios

En la ruta /etc/passwd, podemos ver la información de los usuarios como en el siguiente ejemplo:

```
samdev:x:1000:1000:,,,:/home/samdev:/bin/bash
```
Vemos que separados por `:` tenemos lo siguiente:

username:<contraseña>:userid:groupid:<campos_GECO>:$HOME:pred_shell

. El campo GECO es un campo de información adicional los cuales suelen ser campos como direccion, telefono, compañia etc...

En la ruta /etc/shadow se almacenan las contraseñas que por motivos de seguridad se encuentran encriptados para aumentar la seguridad. Solo puede acceder a esta el usuario root o algún usuario con permisos de sudo.

## Información de los grupos

Para ver la información de los grupos tenemos el archivo /etc/group.

## INFORMACION IMPORTANTE

Para agregar o eliminar tanto usuarios como grupos, no debemos modificar directamente estos archivos ya que podrían generar errores que el sistema no esta preparado para manejar. Estos archivos son de solo lectura, para realiar tareas de añadir o eliminar, hay comandos que nos permiten hacerlo además de preparar el resto del sistema para que este no falle.
