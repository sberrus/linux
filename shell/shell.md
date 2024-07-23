# ¿Qué es shell?

Shell es el entorno en el cual se ejecuta todo el systema.

El shell es la capa externa que tiene linux el cual ayuda a traducir los comandos que nosotros como usuarios ejecutamos, para que los entienda el kernel de linux.

También se encarga de mostrar los resultados de los comandos a los usuarios.

Si es cierto que generalmente se refiere a la shell a la consola de comandos del sistema (cli), realmente se basa en todas las interacciones externas que puedan interactuar directamente con el sistema operativo. Por lo que las GUI también son shell, los servidores web lo mismo, clientes ftp, ssh etc...

El termino linux shell se refiere comúnmente a la consola de comandos

Es una colección de configuraciones, variables ,aliases, etc... los cuales nos permiten interactuar con nuestro sistema.

Define el contexto en el cual los programas van a ejecutar.

Influencia en como los programas van a ser ejecutados. 

## Variables de entorno

Las variables de entorno se utilizan para declarar configuraciones e información globales del shell. Influyen directamente en el shell y en su comportamiento.

Por convención, las variables de entorno se declaran en mayúsculas.

Para ver todas las variables de entorno, usamos el comando `env`

Para definir una variable de entorno debemos hacer uso del comando export.

Esto lo que hace es declarar la variable que definamos como global y podrá ser accedida desde cualquier parte del sistema.

`export GLOBAL_VAR='Hello World!'`

### Scope de las varaibles de entorno.

Las variables de entorno se variables que definimos a nivel de sistema las cuales nos permiten definir información que puede ser accedida desde cualquier parte de nuestro código y desde cualquier entorno indiferentemente de donde se este corriendo. 

Esto es realmente útil para declarar variables o inforamación como credenciales de acceso, claves privadas para acceder a ciertas partes de un sistema entre otros.

Lo que debemos entender es que las variables de entorno son variables que podemos acceder desde cualquier sitio y programa, ya sea un servidor de python, un script de nodejs, un ejecutable de RUST, etc... Desde cualquier sitio dentro de nuestro sistema, los programas pueden acceder a estos. Son parte del sistema, no son dependientes de bash ni de ninguna otra shell.

Las siguientes líneas de código indican como acceder a las variables de entorno en programas python y nodejs:

``` python3
import os
ENV_VARS = os.enviro
```

``` nodejs
envVars = process.env
```

Otra de las cosas a tener en cuenta es que cuando accedemos a las variables de entorno, lo que suelen hacer los sistemas es crear una copia de la variable de entorno, desde dentro de los scripts no se puede manipular las variables de entorno de un sistema.

En bash, a la hora de ejecutar un script, podemos definir temporalmente una variable de entorno para que podamos trabajar con ella o forzar la seguridad de la misma. Simplemente definimos la variable de entorno antes de ejecutar el programa que va a hacer uso de la misma.

``` bash
TEMP_ENV_VAR='this is a temporal env variable' python3 script.py
```

En el ejemplo anterior, además de las variables definidas previamente, podremos enviar una variable temporal para que sea accedida por el script en esa ejecución, luego la variable desaparece. Esto es relevante sobretodo para cuando queremos tener un nivel más de protección para ciertas variables o información supersensible.


Path define las rutas que va a utilizar el sistema para alojar los archivos ejecutables. Los archivos ejecutables que se encuentren en path, van a poder ser accedidos desde cualquier parte del sistema.

Podemos modificar la variable PATH siempre y cuando respetemos las rutas críticas del sistema.

### Variable SHELL

La variable SHELL es la que define que programa va a utilizar como shell por defecto a la hora de definir una consola.

### Variable PS1 (Primary String 1)

Esta variable es la encargada del texto que se muestra cuando estamos en la shell donde vemos la ruta el usuario y demas de nuestra terminal.

```shell
samdev@LaMazunkamba:~/linux$ -> Esto lo define la PS1
```

Para modificarla debemos cambiar los valores de la PS1 de la siguiente manera:

Lo que tengamos en esta variable, es lo que se va a mostrar.

#### Caracteres especiales

En el PS1 podemos definir una serie de variables especiales que PS1 se va a encargar de escapar para que las rellene automáticamente con otros valores.

- \u: Nombre de usuario actual.
- \h: Nombre del host hasta el primer punto.
- \H: Nombre completo del host.
- \w: Ruta completa del directorio actual.
- \W: Nombre del directorio actual.
- $: Símbolo del prompt ($ para usuarios regulares, # para usuarios root).
- \: Un carácter de barra invertida (\).
- \t: Hora actual en formato de 24 horas (HH:MM:SS).
- \T: Hora actual en formato de 12 horas (HH:MM:SS).
- \d: Fecha actual en el formato "día de la semana mes día".
- \n: Nueva línea.
- \r: Retorno de carro (mueve el cursor al principio de la línea).

