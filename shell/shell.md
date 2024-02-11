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

## Varaib
