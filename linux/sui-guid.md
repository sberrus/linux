# SUI  y GUID

Los SUID o GUID son una forma de poder escalar privilegios de un fichero a algún usuario que vaya a ejecutar algún script dentro de nuestro sistema.

Lo que permite es poder asignar en tiempo de ejecución los permisos del usuario que creo el fichero para que otros usuarios puedan ejecutar comandos con sus privilegios. El caso más habitual de escalado de ficheros por UID es el caso del comando `sudo`. Este comando lo que hace es elevar los privilegios de los usuarios que esten dentro del grupo `sudo`, de manera que estos puedan ejecutar comandos e nombre del usuario `root`.

Para definir este permiso especial a un fichero debemos hacer uso del comando.# SUI  y GUID

Los SUID o GUID son una forma de poder escalar privilegios de un fichero a algún usuario que vaya a ejecutar algún script dentro de nuestro sistema.

Lo que permite es poder asignar en tiempo de ejecución los permisos del usuario que creo el fichero para que otros usuarios puedan ejecutar comandos con sus privilegios. El caso más habitual de escalado de ficheros por UID es el caso del comando `sudo`. Este comando lo que hace es elevar los privilegios de los usuarios que esten dentro del grupo `sudo`, de manera que estos puedan ejecutar comandos e nombre del usuario `root`.

El uso de este tipo de ficheros ejecutables es delicado ya que permite que cualquier usuario que cuente con los permisos necesarios, pueda ejecutar comandos en nombre del usuario dueño del fichero en cuestión.

Este tipo de permisos en ciertos sistemas, solo es compatible con binarios ejecutables. Los ficheros .py y .sh, no suelen ser compatibles con este tipo de permisos.

Otra de las cosas que debemos tener en  cuenta a la hora de crear permisos de este tipo es el permiso de (w), debemos evitar y quitar los permisos de (w) a los ficheros para evitar que otros usuraios puedan modificar este fichero y que puedan realizar ejecución de comandos maliciosos en nuestro sistema.

## Comproba si fichero es SUID

Para comprobar dichos permisos, al hacer uso del comando `ls -l <fichero>` podemos ver un log parecido al siguiente:

``` fichero sudo               
-rwsr-xr-x 1 root root 232416 Apr  3  2023 /usr/bin/sudo
   ^
```

El tercer bit de los permisos de ejecución del usuario cuando tiene una `s` indica que el fichero cuenta con estos permisos y que tiene habilitado la ejecución. si tiene definida una `S` en mayusculas, indica que el fichero solo cuenta con el bit de permisos activado pero que no puede ser ejecutado. 

## Definir SUID a fichero
Para definir este permiso especial a un fichero debemos hacer uso del comando `chmod u+s <fichero>`, de esta forma activamos los bits necesarios para dar permisos de SUID y ejecución.

## IMPORTANTE SEGURIDAD

Debemos tener mucho cuidado con los permisos de escritura y ejecución de estos ficheros y a que permisos se los damos. Porque podemos hacer que un fichero o un binario que pueda acceder al sistema, si le activamos los bits de SUID, podemos hacer que cualquier usuario pueda ejecutar un programa en nombre del usuario que ha creado o sea dueño del fichero y este pueda ejecutar comandos en su nombre.

## Ficheros con SGID

En el caso de GUID el sistema funciona de manera similar a SUID con la diferencia de que en este caso, estamos dando ejecutando un fichero con con los permisos de grupo de dicho fichero.

La forma de ver si un fichero tiene esos permisos es en los permisos de ejecución de dicho fichero, en los bits de los permisos de grupo, podemos observar que ne el bit de ejecución, estará definida una `s` o una `S` según sea el caso.

``` permisos de fichero con GUID
-rwxrwsrwx   
```
Para definir estos permisos hacemos uso del comando `chmod g+s <fichero>`
