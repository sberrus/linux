# multitask

La multitarea es una capacidad que tiene el sistema operativo de ejecutar multiples programas al mismo tiempo manejan do correctamente el uso de la cpu y maniobrando de manera que ciertos procesos ocupen más o menos tiempo de CPU. 

Cuando el CPU cambia de un programa a otro, esto se llama "context switch". 

## niceness

Niceness es la forma que tiene linux de asignar prioridad de consumo de CPU un proceso. 

La prioridad va desde -20 siendo este la máxima prioridad hasta +19 siendo esta la mínima.

Por defecto la prioridad de los procesos es 0. Para aumentar la prioridad del proceso (disminuir el niceness), debemos tener permisos de root. Para disminuir la prioridad de un proceso (aumentar el niceness) no hace falta ser root.

Para asignar el niceness de un programa hacemos uso del comando `nice -n <niceness> <program>`. De esta forma podemos ejecutar un programa o comando con una prioridad definida.

Para definir la prioridad de un proceso en ejecución, hacemos uso del comando `renice -n <niceness> <process_id>`, para modificar el niceness de un proceso ya en ejecución.

El porqué el niceness va de valor negativo a positivo respecto a prioridad es debido a la compatibilidad de esta configuración con configuracaiones antiguas de UNIX y también, debido a que un proceso con más niceness, se le considera un proceso más "amigable" con el resto de procesos, por lo que no consume tantos recursos.
