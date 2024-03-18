# Bash Job Control

En esta sección veremos como se manejan en base a las señales, como bash maneja los procesos.

Veremos conceptos como:

- Ejecución de procesos en segundo plano
- El funcionamiento preciso de los pipes `|`
- Como pasar un comando a segundo plano fácilmente.
- Como pausar y resumir un comando fácilmente.
- Como desconectar un programa de la terminal y que el programa siga ejecutando asi cierres la terminal.

## Diferencia entre un `job` y un `program`

Un job es un comando que se ha ejecuta, puede consistir en la ejecución de varios programas por pipes.


Dependiendo de como ejecutes un job, puede ser en foreground, siendo este los programas que ejecutas y el terminal espera a que termine la ejecución del mismo para poder continuar trabajando; o por otro lado tienes background, el cual defines que le job ejecute en segundo plano y desbloquea la terminal para que puedas seguir realizando tareas.

## Ejecutando programas en background `&`

Para ejecutar programas en background, debemos usar al final del mismo un `&`, de esta forma podemos declarar un programa en segundo plano y de inmediate seguir pudiendo operar la consola mientras el programa ejecuta.

El inconveniente que podemos tener es que al momento de realizar dicha acción, el stdout va a seguir ocupando la consola, por lo que podemos ver que si un programa en segundo plano devuelve contenido a la consola esto se nos mostrará indiferentemente de si estamos o no usandola. 

Para eviar esto debemos hacer uso del stdout redirection `>` `>>`. De esta forma podemos redirigir el stdout de dicho programa o directamente descartarlo usando la ruta /dev/null.
