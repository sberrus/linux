# Instalación y configuración de ssh server

Antes que nada, dependiendo de los sistemas en los que se vaya a testear, habrá que configurar los dispositivos para que se puedan comunicar entre ellos. La forma más fácil y rápida es hacer un ping entre dispisitivos a ver si devuelve datos. Si devuelve paquetes el ping no hay que configurar nada (Como es el caso de la coenxión wsl - windows)

Luego de eso es que podemos hacer la conexión.

El paquete para configurar el servidor ssh en ubuntu y CentOS es `openssh-server`.

## conectarse a servidor ssh

Ya configurado el servidor, estando en la misma red, con el comando `ssh` que ya suele venir incorporado en la mayoria de sistmeas operativos y de distribuciones, de la siguiente forma: `ssh <usuario>@<hostname|ip>`

Al ejecutar todo, se te pedirá que te logees con las credenciales de usuario de esa máquina el cual se usará para poder acceder a la misma. Luego, si es la primera vez que te conectas a ese servidor, en el dispositivo cliente, se te va a preguntar si deseas almacenar el `fingerprint` siendo esta una pieza de seguridad que veremos más en detalle en otra sección.

## Prevenir dropeos de conexión

El drope de conexiones es un sistema de seguridad que tiene ssh qeu permite que si un usuario se encuentra inactivo por mucho tiempo, el sistema dropea la conexión. Esto, dependiendo el caso puede ser útil o peligrosos dependiendo de la naturaleza y de que tan protegido este el sistema. Tambén puede paasar cuando estamos trabajando en una máquina y suspendemos el equipo; al volver a reanudar el trabajo, podemos encontrarnos que la sesión ha sido cerrada debido a inactividad o a que el servidor no esta recibiendo paquetes pudiendose modificar este comportamiento para que el servidor mantenga viva la conexión con el dispositivo.

En el caso de que se quiera mantener la conexión abierta, lo que se suele hacer es enviar paquetes de (keep-alive) que son paquetes que se envían constantemente entre el cliente y el servidor para que la conexión se mantenga viva inclusive si no se esta interactuando con la consola remota. Para esto debemos configurar en el cliente o el servidor esta funcionalidad.

Para modificar el comportamiento de las conexiones del servidor (keep alive), haremos lo suguiente: 

- En el caso de Linux, debemos modificar el fichero `/etc/ssh/ssh_config` siendo este el fichero de configuración de el cliente de ssh. **No confundir con el fichero `/etc/ssh/sshd_config`.**

El fichero `/etc/ssh/ssh_config` es un fichero que sirve para la configuración global del cliente de ssh para todos los usuarios del sistema, si queremos modificar la configuración de un usuario en especifico podemos hacer uso del fichero `~/.ssh/config`, debemos a este, darle permisos (600).

La directiva es la siguiente:

```
Host *
    ServerAliveInterval 60 # Intervalo de 60 segundos entre envío de paquetes.
    ServerAliveCount 3 # Máximo número de errores de paquetes consecutivos 3 para mantener conexión abierta.
```


