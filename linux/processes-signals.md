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
- user: El usuario que ha ejecutado dicho proceso.
- state: Un stado en el cual se puede encontrar el proceso (running | waiting | stopped | zombie).
- otros...


