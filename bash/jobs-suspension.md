# Jobs suspension

Dependiendo de lo que querramos hacer, podemos indicarle a los jobs ciertos estados como `suspend` y `resume` los cuales paran o reanudan los jobs en ejecución.

Para suspender un proceso desde la terminal lo hacemos mediante `ctrl + z` el cual suspende el job madnandole una señal `SIGTSTP` al programa y lo manda a segundo plano. Luego podemos ver usando el comando `jobs` que el proceso ha sido suspendido y lo veremos como `Stopped`.

Tenemos varias formas de continuar con la ejecución de un proceso como las siguientes:

- fg %<job_id>: Reanudamos el job y lo mandamos al foreground.
- fg %<job_id> &: Reanudamos el job y lo mandamos al background.
- bg %<job_id>: Reanudamos el job y lo mandamos al background.


