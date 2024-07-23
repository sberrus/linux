# anacron

`anacron` es una alternativa que tenemos para realizar cronjobs dentro de los sistemas ubuntu. En especial, este se suele usar en los ubuntu ya que en otros sistemas como kali o CentOS suele ser diferente.

La diferencia entre `anacron`y `crontab` es que en el caso de `anacron` depende más de las caracteristicas de systemd, por lo que este solo se ejecuta cuando el sistema esta arrancado.

En el caso de que se apague el sistema, cuando se vuelve a arrancar, `anacron` se encarga de revisar las ejecuciones que debio haber realizado cuando el sistema se apago, y ejecuta todas las que sean necesarias.

## Como se utiliza

La forma más sencilla para definir directivas debemos añadir enlaces de un fichero ejecutable o los ficheros eejcutables en los siguientes directorios del sistema:

- /etc/cron.daily
- /etc/cron.weekly
- /etc/cron.monthly

De esta forma, podemos definir que procesos queremos que se ejecuten de forma diaria, semanal o mensual; dependiendo del caso.

Para evitar problemas, debemos usar caracteres `a-z,A-Z,0-9,_,-` en el nomrbe de los ficheros; de lo contrario, puede dar problemas.

La segunda forma que tenemos para definir los jobs es modificando el fichero `/etc/anacrontab`. Este fichero es el encargado de definir las directricez de anacron y podemos modificar ciertos comportamientos.

La forma que tenemos para definir directivas es la siguiente: [frecuencia en días] [minutos después del arranque del sistema] [identificador para la última ejecución] [comando a ejecutar]

``` directivas por defecto de anacron
1       5       cron.daily      run-parts --report /etc/cron.daily # -> la primera columna define que se va a ejecutar todos los días. La segunda, que ejecute pasados 5 minutos después de que haya iniciado el sistema, en el caso de que no se haya ejecutado el proceso como debio haberse ejecutado. La tercera, indica el identificador de dicha directiva. El resto de columans, son los comandos que van a ejecutarse de dicha directiva. Por lo que para resumir, el comando `run-parts --report /etc/cron.daily` se va a ejecutar todos los días, identificado como cron.daily y en el caso de que por algún motivo, no haya sido posible ejecutar el proceso cuando debio, se ejecutara 5 minutos pasado el arranque del sistema.
7       10      cron.weekly     run-parts --report /etc/cron.weekly
@monthly        15      cron.monthly    run-parts --report /etc/cron.monthly # En este caso, al tener los meses distintos días, utilizamo @monthly para definir que se ejecute todos los meses.
```
