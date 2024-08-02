# COMANDO `tee`

El comando `tee` nos permite redirigir al mismo tiempo el `standard output` a un fichero que deseemos, además de que permite seguir ejecutnado procesos en la misma sentencia. 

``` usando comando tee
echo hola mundo | tee out.txt # almacena el `standard output` en out.txt ademas de que lo muestra en consola la salida.
```

Esto nos permite tener pasos en los cuales podamos debuggear de manera más sencilla.


Entre otras cosas podemos:

- almacenar el output en multiples ficheros.
- Haciendo uso del error redirection, podemos indicar que la salida `standard error` vaya al `standard output` con `<comando> 2>&1 | tee <fichero | ficheros>`. * también podemos elevar privilegios con `sudo` para que el dueño del fichero sea root.
