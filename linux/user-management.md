# User management

## Comandos para manejar usuarios:

`useradd [options] username`

user options:
-m: Crea el directorio home del usuario en la ruta predeterminada.
-d: Crea el usuario home en una ruta personalizada.
-s: Especifica la shell predeterminada del usuario.
group options:
-g: Especifica el gurpo principal en vez del predeterminado. El grupo predeterminado es un grupo con el mismo nombre de que el nombre de usuario.
-G: Añade otros grupos adicionales.

## Comandos para manejo de contraseñas

`passwd <options> <username>`

options:
-S: Muestra el estado de la contraseña del usuario.
-d: Elimina la contraseña del usuario.
-n: Configura el mínimo de edad de refresco de la contraseña (en dias). Indica cuanto tiempo debe esperar el usuario para poder renovar la contraseña.
-x: Configura el máximo de edad de la contraseña (en dias). Indica cada cuanto tiempo debe cambiar la contraseña el usuario.
-l: bloquea al usuario.
-u: desbloquea al usuario.

```Output comando passwd <user>
<user> P 02/24/2024 0 99999 7 -1
```

Por columnas podemos ver que el primer campo es el usuario, luego la P indica que es una contraseña normal, luego la fecha del ultimo refresco de la contraseña, luego la cantidad de días minimo para el cambio, luego la cantidad de días máximo que tengo para cambiar la contraseña, seguido de la cantidad de días en la que el sistema va a avisarme de que tengo que modificar la contraseña y por último la cantidad de días que puedo acceder al sistema pasada la caducidad de la contraseña.

## Buenas prácticas en el manejo de usuarios

- A la hora de crear organizaciones de usuarios, primero piensa en los grupos y en que permisos estos van a tener.
- Tal como en programación, intentar que los nombres de los grupos sean legibles.
- Seguir el principio de `últimos privilegios`.
	- Asignar a los usurios solo los permisos que este vaya a utilizar y asignarle los grupos pertinentes de manera correcta.
	- Evitar conceder permisos innecesariamente a los usuarios.
	- Evitar en lo posible dar permisos de escritura (w) a los usuarios a ficheros que no sea necesarios que vaya a necesitar.
- Mantener actualizados los grupos de manera que podamos evitar que usuarios que ya no vayan a formar parte de ciertos equipos o que ya no formen parte de la organización, puedan seguir accediendo a los recursos que se les tenga asignados.
- Regularmente hacer reviews acerca de los permisos de los grupos, si a los usuarios les hacen falta más o si estos cuentan con demasiados permisos.
