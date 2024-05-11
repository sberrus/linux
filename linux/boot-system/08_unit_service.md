# Creando tu propio unit

Ya visto todo lo anterior, veremos como crear nuestro propio unit.

Vamos a crear un fichero de tipo unit con el siguiente comando `systemctl edit --full --force <nuevo_servicio>`. Usamos el mismo comando que usamos para crear una expansión del servicio, pero con los flags `--full --force` indicamos al sistema que cree uno nuevo en caso de que no exista. \*Si no tiene estas flags, devolvera error porque el servicio no existe.\*

``` fichero my-network-log.service
[Unit]
Description: ping a srever and log it
Requires: network.target
After: network.target

[Service]
Type=oneshot
StandardOutput=append:/network-log/log.txt
ExecStart=date '+%%T'
# en la linea superior se ve %% en vez de una sola porque el uso de % es un wildcard de systemctl que hace una especie de expansión propia para porpagar ciertos datos del sistema para poder usarlos en nuestors services.
ExecStart=ping -c 4 google.com

[Install]
WantedBy=multi-user.target
```

Tras ejecutar el comando, pegamos el contenido del unit superior, guardamos y salimos. Ya con esto tendríamos el servicio creado y actualizado. Con esto ya podemos usar el comando `systemctl`. Para que gestione dicho servicio, pudiendo usarse `start, stop, restart, enable, disable, etc.`.

En este caso, para ejecutarlo manualmente hacemos uso de `systemctl start my-network-log.service` y se ejecutará el comando. 

## Nota importante para entornos CentOS
En los equipos CentOS, los logs del sistema deben estar definidos dentro de la ruta `/var/log`
