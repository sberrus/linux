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


