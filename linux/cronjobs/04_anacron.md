# anacron

`anacron` es una alternativa que tenemos para realizar cronjobs dentro de los sistemas ubuntu. En especial, este se suele usar en los ubuntu ya que en otros sistemas como kali o CentOS suele ser diferente.

La diferencia entre `anacron`y `crontab` es que en el caso de `anacron` depende más de las caracteristicas de systemd, por lo que este solo se ejecuta cuando el sistema esta arrancado.

En el caso de que se apague el sistema, cuando se vuelve a arrancar, `anacron` se encarga de revisar las ejecuciones que debio haber realizado cuando el sistema se apago, y ejecuta todas las que sean necesarias.

## Como se utiliza

Para ello debemos añadir la ruta de un fichero ejecutable en los siguientes ficheros del sistema:

- /etc/cron.daily
- /etc/cron.weekly
- /etc/cron.monthly

Para evitar problemas, debemos usar caracteres `a-z,A-Z,0-9,_,-` en el nomrbe de los ficheros; de lo contrario, puede dar problemas.

