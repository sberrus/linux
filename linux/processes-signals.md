# Processes and signals

Los procesos y las señales son una forma que tiene le sistema de ejecutar procesos con los cuales mediante señales, podemos indicar ciertos estados de dichos procesos.

Las señales son una especie de mensajes que podemos enviar a un proceso de manera que este pueda pausar, resumir o eliminar un proceso del sistema.

Podemos también según el caso, asignar a los procesos prioridades. También podemos controlar los procesos mediante señales como `kill`o `killall`.

Veremos la forma de ver todos los procesos en ejecución con los comandos `top` y `htop`.

## Procesos

Los procesos son instancias de un programa a los cuales podemos asignarles recursos para que estos dependiendo de la prioridad, puedan acceder a más o menos recursos del sistema. Estos a su vez, pueden acceder a ficheros en el sistema y a recursos de red como conexiones entre otras acciones los cuales pueden o no ser compartidos con otros recursos.

Los procesos son manejados por el kernel, este es el que se encarga de asignar los recursos a los procesos como la cantidad de tiempo en cpu que este va a ocupar, que tanta ram va a asignar a dicho proceso entre otras asignaciones.

Cada proceso tiene las siguientes características:

- PID: Process id. La identificación única de los procesos en el sistema.
- User: El usuario que ha ejecutado dicho proceso.
- State: Un stado en el cual se puede encontrar el proceso (running | waiting | stopped | zombie).
- Parent ID: El id del proceso padre del proceso que estamos consultando, en el caso de tenerlo.
- otros...

## Revisar los procesos en ejecución

Para ver los procesos en ejecución tenemos el comando `ps` -> process status. Este comando nos lista los procesos que estan en este momento en ejecución en el sistema. Por defecto muestra los procesos que esta ejecutando el TTY en ese momento.

Con el uso de las flags, podemos tener comportamientos diferentes como:

- `ps -e | ps -A`: Se muestran todos los procesos de todos los usuarios y sesiones.
- `ps -f`: Muestra los procesos con información extendida.
alias lt='ls -lht --color'
- `ps -l`: Muestra la información en formato long, con más información.
- `ps -p <proceso,proceso>`: Con este comando podemos ver la información de un proceso en especifico. También podemos listar varios procesos si lo necesitamos.
- `ps --forest`: ver los procesos como tree.
- `ps aux`: Ver la información extendida de los procesos siguiendo el estandar BSD, este estandar es los que se suelen basar los sistemas BSD.

### ruta /proc/[prod_id]

Otra de las maneras que tenemos de obtener información de los procesos es mediante la ruta `/proc/[proc_id]/`, en este directorio tenemos 3 ficheros que contienen información relacionada con el proceso que estamos consultando.
