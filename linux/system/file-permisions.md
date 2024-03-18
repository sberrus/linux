# Permisos en linux

Los permisos es una forma que tienen los sistemas linux de controlar ciertos aspectos como la lectura, escritura y ejecución de ficheros en linux, además de controlar quién puede realizar dichas acciones.

Hay 3 niveles de permisos a quienes podemos conceder: dueño(u) grupo(g) otros(o).

Cuando ejecutamos el comando `ls -l` podemos listar y ver los permisos que tienen los ficheros.

```
-rw-r--r-- 1 samdev samdev 4362 Feb 28 14:15 sudo-management.md
```

Las columnas que nos interesan son las siguintes:

- La primera columna podemos ver los permisos de este archivo. Consta de 1 caracter indicando el tipo de fichero seguido de 9 caracteres que si los separamos de 3 en 3, indican lo siguiente relacionado con los permisos del archivo:
 
	- Primeros 3 caracteres: Permisos de usuario.
	- Segundos 3 caracteres: Permisos de grupo.
	- Terceros 3 caracteres: Permisos de otros.

- La tercera columna indica el usuario dueño del fichero.

- La cuarta columna indican el grupo del fichero.

## Tipos de permisos

En los tipos de permisos tenemos los siguientes:

Read (r/4): Permite lectura de fichero. En el caso de directorios, permite el listado de los mismos.
Write (w/2): Permite escritura/eliminación de ficheros.
Execution (x/1): Permite ejecución de fichero. En el caso de directorios, permite la navegación dentro del mismo.

## Asignar permisos a usuario

Para asignar permisos a un usuario usamos el siguiente comando `chmod <n><+ | -><p> <fichero>` siendoÇ:
n: nivel de permiso (u,g,o)
+ | -: para asignar o quitar permiso.
p: tipo de permiso (w,r,x)

Por lo que para asignar un permiso al dueño del fichero lo hariamos de la siguiente forma: `chmod u+x <fichero>`
Para quitar un permiso hariamos: `chmod g-w <fichero>`

### Cambiar permisos eficientemente

Viendo los tipos de permisos hemos visto que los permisos tienen unos valores númericos también:

Read: 4
Write: 2
Execute: 1

Esto sirve para asignar comandos de forma más eficiente indicando los permisos necesarios para cada nivel. Ej `chmod 751 <fichero>`. Cada valor indica el tipo de permisos que tiene cada nivel por lo que de izquierda a derecha indica los tipos de accesos para dueño, grupo y otros. Y los números indican lo siguiente:

7 = rwx (4 + 2 + 1)
6 = rw (4+2)
5 = rx (4+1)
4 = r (4)
3 = wx (3)
2 = w (2)
1 = x (1)

Sencillamente son una suma de los valores indicados anteriormente y sumandolos podemos tener valores desde el 7 al 1 indicando el tipo de permiso para cada nivel.

## Modificar dueño y grupo de fichero

Para modificar quien es dueño y grupo del fichero hacemos uso del comando `chown <usuario>:<grupo> <fichero>`. 


