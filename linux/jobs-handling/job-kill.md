# Matando jobs

Para matar un job, usamos el comando `kill %<job_id>`, esto nos permite enviar una señal SIGTERM al job en cuestiçon, si esto no llegase a funcionar, podemos mandar con la flag `-s SIGKILL` para enviar una señal de para job de forma forzada.

Tener en cuenta el `%` debido a que esto indica que queremos eliminar un job por su job_id.

## Problema con stty

Como hemos visto anteriormente, cuando queremos pasar un proceso a segundo plan, el output de ese programa sigue apareciendo en la terminal. Si queremos hacer que no se vea el output debemos redirigir la asalida del stdout a /dev/null, pero como podemos hacer para que esto no ocurra? usamos el comando stty el cual podemos pasarle 2 argumentos para que maneje esas salidas de output.

`ssty tostop`: Este comando lo que hace es que va a mandar el comando al background cuando el comando que queremos mandar al bg, emita algún output y va quedar en estado (S) hasta que con el uso del comando `fg %<job_id>`, este no va a volver a reanudar la ejecución de dicho comando.

`stty -tostop`: Comportamiento habitual de la salida de output en segundo plano.
