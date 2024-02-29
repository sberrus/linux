# umask

`umask` es la forma que tenemos para definir los permisos que tiene un fichero a la hora de ser creado por cualquier usuario del sistema. Se trata de la configuración global que van a serfguir todos los ficheros que vayamos a crear de manera predeterminada.

Es muy importante para la seguridad del sistema y para los administradores es una herramienta muy eficiente.

Lo que hace `umask` es a partir de la configuración predeterminada del sistema, declara una serie de reglas por encima que nosotros podemos modificar a la hora de crear ficheros en el sistema.

La configuración predeterminada relativa a los permisos en los sistemas linux suele ser `777` para directorios y `666` para ficheros.

De forma predeterminada `umask` esta definido en `022` el cual significa que los directorios se configurarán con los permisos `755`  los ficheros en `644`.

La lógica de `umask` es que por ejemplo: si los directorios tiene los permisos en `777` y tenemos el `umask` en `022`, lo que se hace es restar el valor de `umask` en el bit correspondiente y genera el nuevo valor. Por lo que los permisos de los directorios será el siguiente (777:022) -> 755, en el caso de los ficheros sería (666:022) -> 644.

Si ejecutamos el comando `umask` devuelve el valor actual de `umask`. 

Al ejecutar el comando veremos un log similar a `0002` correspondientes a: 

- valor 1: bitvalue
- valor 2: bitmask para permisos (u)
- valor 3: bitmask para permisos (g)
- valor 4: bitmask para permisos (o)

## modificar umask el iniciar el sistema

Para modificar el `umask` al iniciar el sistema debemos realizarlo mediante la configuración de los ficheros de arranque de sesión como es ~/.bashrc 
