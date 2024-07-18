# flock command

`flock` es un comando que nos permite bloquear un fichero para que solo un proceso pueda acceder a este al mismo tiempo.

Es una forma que tenemos de asegurar la integridad de los datos y evitar sobreescrituras innecesarias en el mismo para evitar bugs.

Ej: `flock file.txt ping google.com` -> este comando hará que el fichero file.txt va a estar bloqueado hsasta que el programa ping termine de ejecutar. 

Una de las caracteristicas que tenemos con flock es que podemos hacer una especie de proceso asyncrono por el cual, si apuntamos varios procesos al mismo fichero, estos no van a ejecutar hasta que los procesos anteriores hayan acabado. Esto nos permite que podamos controlar los procesos y evitar, en el caso de que no lo deseemos, que dos procesos corran en simultaneo, pero si queremos que al acabar uno, empiece el otro..

Lo interesante es que no hace falta escribir nada en el fichero, este funciona como una especie de fichero de control.

También podemos asegurar de que un programa cancele la ejecución del proceso si ya hay otro programa ejecutando que este apuntando al mismo fichero con flock. EJ:

```
# Proceso 1
flock -n -E 0 wait.txt ping google.com # Proceso 1 ejecutando

# Proceso 2
flock -n -E 0 wait.txt ping google.com # Proceso 2 cancela ejecución ya que el proceso 1 esta ejecutando y esta usando el fichero wait.txt
```

Como buena práctica, se recomienda usar la extensión .lock para indicar que es un fichero de control de ejecución.

Básicamente para resumir, flock y cronjob en conjunto, nos permiten crear tareas cíclicas que dependiendo de la necesidad que tengamos, podemos o bloquear el programa o evitar que este corra si ya esta ejecutandose en ese momento.
