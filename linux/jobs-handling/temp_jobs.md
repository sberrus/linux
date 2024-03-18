# Viendo los trabajos que estan ejecutando en máquina

Para ver los comandos que estan siendo ejecutados en máquina hacemos uso del comando `jobs` el cual nos permite listarlos.

Esto nos devolvera una lista de todos los jobs que estan ejecutando y el estado en el que se encuentran.

Cuando un proceso esta corriendo en el background, no podemos tener control de los procesos porque la consola esta en otra shell realizando otras tareas, por lo que si queremos traer un job del background al foreground, usaremos el comando `fg %<job_id>`.

Cuando ejecutamos el comando `jobs` veremos un aoutput similar al siguiente:

``` output del comando jovs con dos procesos ejecutando en segundo plano.
[1]-  Running                 ping -c 100 google.com > /dev/null &
[2]+  Running                 ping -c 100 bing.com > /dev/null &
```

En la primera columna veremos un identificador para cada job, siendo este el que debemos pasarle para traerlo al foreground con el comando fg

Solo los procesos que estan en el foreground son aquellos que pueden recibir inputs de nuestro teclado.


