--- temporal para añadir a fichero de señales ---

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
