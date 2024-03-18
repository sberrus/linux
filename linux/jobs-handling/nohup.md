# comadno nohup

El comando `nohup` es un comando que nos permite que un proceso ejecute sin que este forme parte de los procesos hijos de la terminal.

Como bien hemos visto con anterioridad, cuando se ejecuta un proceso en bash, este pertenece al padre que lo ha ejecutado. En el caso de procesos que hayamos ejecutado desde la terminal, si esta la cerramos, va a enviar la señal `SIGHUP`, por lo que todos los procesos hijos de esa terminal van a cerrarse.


Con el comando nohup, lo que hacemos es asignarle como padre al proceso que lancemos con este comando, el padre del terminal. Por lo que en el caso de que cerremos la terminal, esta no cerrará e lcomando.

Otra particularidad es que el output del comando que vayamos a ejecutar en el sistema va a ser almacenado en el fichero `nohup.out` en el CWD donde se ejecuto el comando o en ciertos sistemas puede ir directamente en la raiz (/)

## Diferencia entre nohup y &

La diferencia entre estos dos comandos es que al momento de usar nohup, al momento de cerrar la terminal, esta no va a enviar la señal SIGHUP al proceso por lo que este seguirá ejecutando. Hay que tener en cuenta que este proceso no recibirá el comando SIGHUP pero si recibe el comando SIGINT, por lo que el proceso se va a mantener en el foreground y si presionamos `ctrl + c`, el proceso en cuestión finalizará de ejecutar.

En el caso de `&`, vemos que el proceso pasa a segundo plano y nos sigue mostrando el output del comando a menos que lo redirijamos, a su vez, este nos devuelve el control de la terminal. Pero este proceso si va a recibir la señal SIGHUP. 

Otra alternativa que tenemos es la de usar el comando combinando `nohup <...comandos> &`, de esta manera podemos pasar un comando a segundo plano, que no se cierre al cerrar la consola y que no muestre el input ya que el input se iria a `nohup.out`.


