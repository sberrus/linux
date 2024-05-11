# Unit Timers

En systemd tenemos una forma de controlar cuando se debe ejecutar un servicio, esto gracias a la capacidad e los units de tipo Timers.

Los timers entre otras cosas programan la ejecución de servicios mediante su configuración. Para esto creamos otro servicio con la ayuda de systemctl y terminamos con la extensión `.timer`.

Para que haya un timer, debe existir previamente un unit creado que va a ejecutarse. Además, el nombre del timer, debe coincidir con el nombre del unit que ejecuta.

Para ver como crear un timer personalizado, haremos lo siguiente:

Creamos el unit timer con el comando `systemctl edit --full --force <unit.timer>` e introducimos el siguiente contenido:

```
[Unit]
Description: Run the network logging service on boot

[Timer]
OnActiveSec=5
Unit=my-network-log.service # Cabe destacar que no se necesario definir el unit ya que systemd correlaciona el nombre del servicio que va a ejecutar sacandolo del nombre del .timer per se. Lo dejo definido para que sea más explícito.

[Install]
WantedBy=Timers.target
```

Para ejecutar el timer, lo hacemos de la misma forma que se ejecutan los servicios, con el comando `systemctl start <unit.timer>`
