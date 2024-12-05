# Cronjobt, como funcionan.

Los cronjobs tienen un daemon en segundo plano `crond` el cual se encarga de gestionar los jobs y la configuración que necesitemos utilizar.

Este se ejecuta cada cierta cantidad de tiempo evaluando si algún proceso debe ser ejecutado.

## crontab files

Los crontab files son los ficheros que contienen la configuración que los distintos crons van a necesitar. Estos suelen estar alojados en 2 sitios dependiendo de quien sea el dueño de los crons.

- User specific: suele encontrarse en `/var/spool/cron/crontabs/` o en `/var/cron/tabs`. Estos ficheros no deben modificarse directamente.
- System wide: Se encuentra normalmente en /etc/crontab. 

Otro sitio en el que los sistemas Ubuntu/Debian suele buscar también es en el directorio `/etc/cron.d` pero no se recomienda que se utilice o modifique ya que hay formas más seguras de hacerlo.

## Crear tu primer cronjob

Para editar el fichero `crontab`, lo hacemos mediante el comando `crontab -e`. La primera vez que se ejecute, nos va a pedir que seleccionemos un editor.

Esto va a abrir el crontab del usuario que ha ejecutado el comando. Cada usuario tiene su propia tabla de `cronjob` la cual utiliza para realizar las tareas programadas.

## Ver el cronjob del usuario

Para ver los cronjobs del usuario que lo ejecuta lo hacemos mediante el uso de `crontab -l`.

## formato de los cronjobs

Los cronjobs, para especificar los formatos de tiempo en el fichero `cronjob`.

En este fichero vamos a definir, primero las variables de entorno que va a usar cronjob para ejecutar las tareas, luego, la línea de la sentencia con el formato de hora que vamos a utilizar.

Primero debemos definir 2 variables importantes para los crontabs que son (SHELL y PATH). Esto va a variar dependiendo de la distribución que estemos utilizando. Por ejemplo, queremos uqe se ejecute el comando `ping -c 10 google.com` cada minuto. Por lo que luego, haremos lo siguiente en el fichero:

```
SHELL=/bin/bash
PATH=/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:/bin:/usr/bin

* * * * * ping -c 10 google.com
```

Los formatos de tiempo para los cronjobs son los siguientes:

[Minutes] [Hours] [Day] [Month] [Day-of-Week] [Command]

También, tenemos wildcards y atajos para poder crear cronjobs más eficientes:

- 5 3 * * * -> Todos los días a las 03:05

- 0,15,30,45 * * * * -> Todos los días a todas las horas en los minutos 00,15,30,45.

- 0 8-20 * * * -> Todos los días entre las 08:00 y las 20:00 en el minuto XX:00

- */5 * * * * -> Todos los días a toda hora cada 5 minuto.

- 0 */2 * * * -> Todos los días, cada 2 horas.

- 0 1-23/2 * * * -> Todos los días, cada 2 horas, entre las 01:00 y las 23:00.

- 0 0 * * 1 -> A las 00:00 los lunes

## Debugging cronjobs

Para hacer tareas de debuggin, podemos revisar los logs del servicio `cron.service` haciendo uso del comando `journalctl -u cron.service -f` para ver en tiempo real los errores.

Por lo general, cron maneja la salida de los jobs de la siguiente manera:

- Redirigiendo la salida y almacenandola en un fichero. *Si no se define una salida de los logs, se utiliza por defecto el MTA*
- Utilizando el Mail Transfer Agen (MTA) del sistema para enviar la salida por correo.

## CentOS

En centos funciona ligeramente diferente, ya que el servicio se llama crond.service y los logs de journalctl son diferentes.

## Ejecuciones globales system-wide

Como hemos indicado anteriormente, los cronjobs se definen en principio para cada usuario, por lo que estos son los dueños y tienen los permisos que el usuario en sí tenga; pero, como hacemos para crear cronjobs para todo el sistema? que tenga permisos globales?

Para lograr esto debemos hacer uso de los system-wide cronjobs, para poder acceder a estos debemos editar el fichero /etc/crontab directamente 

La definición del cronjob en system-wide es similar a la del os cronjobs de los usuarios, con la diferencia de que hay que añadir un campo adicional que es el campo user-name, siendo este el que define que usuario será el propietario de dicho cronjob; quednado de la siguiente manera:

[Minutes] [Hours] [Day] [Month] [Day-of-Week] [user-name] [Command]
