# Creando tu propio unit

Ya visto todo lo anterior, veremos como crear nuestro propio unit.

Vamos a crear un fichero de tipo unit con el siguiente contenido:

``` fichero my-network-log.service
[Unit]
Description: ping a srever and log it
Requires: network.target

[Service]
Type=oneshot
StandardOutput=append:/network-log/log.txt
ExecStart=date '+%%T'
# en la linea superior se ve %% en vez de una sola porque el uso de % es un wildcard de systemctl que hace una especie de expansión propia para porpagar ciertos datos del sistema para poder usarlos en nuestors services.
ExecStart=ping -c 4 google.com

[Install]
WantedBy=multi-user.target
```


