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

## Herramientas para revisar procesos en ejecución

- pgrep: con este comando, pasamos el nombre del proceso que queremos buscar y este nos devolverá solo el id del mismo. Lo bueno es que busca el proceso raíz que coincida con el patron pasado. Si queremos ver los hijos del proceso usamos la flag -f.
	- renice -n <niceness> $(pgrep -f <process_name>): Para cambiar el niceness de todos los procesos de un proceso padre al mismo tiempo.

## SIGNALS

Las señales son una forma que tenemos de enviarle mensajes a los procesos de manera que estos puedan interrumpir la ejecución de manera inmediata. Las señales las maneja el sistema operativo.

Todas las señales empiezan con la palabra `SIG`, seguido de la señal que queremos enviar. Ej: `SIGINT`, que es el identificador de la señal `SIGNAL INTERRUPT`.

Para mandar señales a los procesos usamos el comando `kill` que detallamos a continuación.

### Enviando señales a procesos

``` url de descarga de fichero de descarga lenta para práctica
https://downloads.codingcoursestv.eu/055%20-%20bash/wget/download-slow
```

Para enviar señales a un programa usamos el comando `kill -s <signal>`, de esta forma podemos definir el tipo de señal y a que proceso podemos mandarlo, también podemos pasar la señal a varios procesos de manera simultanea.

Las señales las podemos listar con el comando `kill -l`. Este comando devuelve una lista de señales que podemos pasar al comando con la flag -s, pero también tiene un número, por lo que si deseamos podemos pasarle el número también.

- 15) SIGTERM: Esta señal se envía a los procesos para ejecutar un cierre ordenado del mismo. Este es la señal predeterminada que tiene el comando `kill`, por lo que si enviamos este comando sin la flag `-s <señal>`, va a enviar por defecto la señal SIGTERM.

- 2) SIGINT (ctrl + c): Esta es la signal que se ejecuta cuando presionamos `ctrl + c` en la ejecución de un programa. Lo que hace es interrumpir la ejecución de un programa y devolvernos a la shell.
Hay ciertos programas que tienen configurado que no hagan caso a al señal `INT`.

La diferencia entre SIGTERM y SIGINT es que en el caso de SIGTERM es una forma explicita de indicarle al programa desde dentro que hay que cerrarlo. En el caso de SIGINT, es un cierre que se hace a nivel de usuario que esta interactuando con la shell y quiere volver a la misma.

La diferencia radica en que ambos casos, la intensión es diferente, siendo SIGINT la que esta indicando que el usuario es quien manualmente ha pedido cerrar el proceso para continuar realizando tareas con el shell.

En ambos casos indica un cierre ordenado del programa, lo que significa que indica un cierre ordenado del proceso. Por ejemplo, si queremos cerrar el proceso de una bbdd que esta realizando transacciones, podemos mandarle al proceso la señal SIGTERM y el proceso se encargará de finalizar las transacciones que esten ejecutando y para las que esten en cola, cuando termine de ejecutar lo que necesite el proceso se cerrara.

- 4) SIGKILL: Esta señal es un cierre forzoso del proceso. Debemos usar esta señal con cuidado debido a que esta no realiza comprobaciones de ningún tipo y puede dejar programas y procesos a medio procesar.

- SIGHUP: Esta señal se envia a los procesos hijos de un proceso padre que ha sido cerrado. 

Para los daemons (procesos en segundo plano) esta señal indica que debe reiniciar la configuración del proceso.
- SIGSTOP: Esta señal indica al proceso que debe ponerse en estado de pausa. No hay forma de hacer que un proceso ignore esta señal. Para que el proceso vuelva a ejecutar, debemos pasarle la señal SIGCONT.
- SIGCONT: Para reanudar la ejecución de un proceso que ha sido pausado. Cabe destacar que el proceso puede ser un proceso hijo, por lo que si hay un proceso que afecta a una terminal y lo paramos, podemos ejecutar el proceso nuevamente en la misma terminal que ha ejecutado. 

## Diferencias entre kill /usr/bin/kill vs /bin/kill

En el caso de kill, existen dos formas de ejecutar este comando, por el sistema operativo y por el kernel. La diferencia que tienen estos aparte de el punto de entrada `kill` para kernel y `/usr/bin/kill` para el OS.

El como se ejecuta el comando `kill`va a depender de la shell que estemos ejecutando ya que por ejemplo bash no utiliza la misma ruta para el comando `kill` que zsh por ejemplo.

## comando killall

Hemos visto como elminar un proceso individualmente o por lotes madando varios PID al mismo tiempo. También vimos que con el uso de `pgrep <process_name>` podemos ver los procesos que contengan como process name y devuelve sus IDs, pero para evitar realizar trucos en los comandos, bash nos ofrece el comando killall, que este pasando el nombre del proceso, va a buscar a todos los procesos que contengan ese nombre y los va a parar dependiendo de la señal que le enviémos como el siguiente `killall -s <signal> <process_name>`. Por defecto envía la señal SIGTERM al proceso.

## Salidas de procesos

Dependiendo de en que lugar se haya realizado la salida del proceso como podemos encontrarnos con los isguientes tipos:

- Child termination - salida de proceso hijo
Los procesos al finalizar su ejecución, liberan los recursos que estos estaban utilizando para que otros procesos puedan hacer acopio de ellos.

Por otro lado, cuando un proceso hijo acaba, este envía una señal SIGCHLD al proeceso padre para que libere los recursos y complete los procesos de eliminación de dicho proceso hijo.

- Process reaping - captura de codigo de salida de proceso hijo.
Los procesos padres, pueden escuchar a la salida de un proceso hijo y actuar en consecuencia.

- Orphan Process - proceso huerfano
Este tipo de proceso se refiere a aquellos procesos que se han quedado sin padre o que en el momento de la llamada a dicho proceso, el padre a declarado que ese proceso no forme parte de sus hijos. Esto podemos hacerlo manualmente con el comando nohup.

- Zombie process - proceso zombie
Estos son procesos que ya han finalizado su ejecución, pero el padré no ha gestionado correctamente la finalización del mismo, por lo que seguirá estando listado en la lista de procesos en ejecución aún no este realizando nada.

Estos procesos no ocupan memoria ni CPU pero si ocupan un slot en la tabla de procesos el cual tiene un máximo de slots disponibles y tendrá más o menos dependiendo del sistema.

Para ver el máximo de procesos que pueden correr al mismo tiempo en nuestra máquina debemos ver el contenido del fichero `/proc/sys/kernel/pid_max`

Los procesos zombies los podemos localizar facilmente con el comando `ps -l` el cual lista todos los procesos con una letra en mayuscula en la segunda columna indicando el tipo de proceso que es. Los procesos zombiesestan definidos con una `Z`.

## Estados de los procesos

Los estados de los procesos es la forma que tenemos de ver en que estado se encuentra un proceso de forma rápida. Esto lo hacemos mediante el comando `ps -l`. Cuando ejecutamos el comando veremos un lgo como el siguiente:

``` salida comando ps -l
F S   UID     PID    PPID  C PRI  NI ADDR SZ WCHAN  TTY          TIME CMD
0 S  1000   11812   11780  0  80   0 -  2333 do_wai pts/2    00:00:00 bash
```

Como podemos ver, nos muestra la lista de procesos en el formato long. En la segunda columna, podemos ver el estado del proceso. Tenemos distintos estados de los procesos como los que veremos a continuación:

- R (running): Este estado indica que el proceso se encuentra ejecutando en la máquina consumiendo en ese momento CPU.

- S (sleeping): Este estado indica que el proceso esta durmiendo, la diferencia entre (S) y (R), siendo ambos casos para proceoss abiertos, radica en que los procesos en estado (S) son los procesos que estan abiertos pero que no estan siendo interactuados por ningún usuario en ese momento. Por lo que se mantienen en estado (S) y consumen menos recursos que en estado (R).

- D (uninterruptible sleep): Este estado indica que el proceso en cuestión esta en un estado parecido a (S) pero que no admite ninguna señal por parte del kernell. Esto suele ser utilizado pro procesos (I/O) los cuales esten leyendo un fichero o tratandolo para realizar operaciones.

Hay veces en los que por ciertos factores, un proceso puede quedarse en estado (D), para pararlo, la única forma que tenemos es usando la señal SIGKILL.

- T (traced or stopped): Este estado indica que le proceso ha sido pausado mediante la señal SIGSTOP,SIGTSTP o mediante ptrace para debugging. Este no volverá al estado (R) hasta que mandemos la señal SIGCONT.

- Z (zombie): Este estado indica que el proceso esta en estado zombie por lo que la única vía que tiene este proceso es salir.  

## programa `top` `htop`

top y htop, son dos programas que usualmente vienen instalados en los sistemas que nos permiten ver todos los programas e información del sistema relativo al consumo de memoria y CPU de la máquina. Siendo htop más moderno.

Con el comando `top` podemos pasar ciertos argumentos para declara cosas como que solo muestre los procesos de un usuario, el tiempo de refresco para cada impresión, un modo que no muestra los procesos que no esten consumiendo CPU etc...


