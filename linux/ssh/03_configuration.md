# Instalación y configuración de ssh server

Antes que nada, dependiendo de los sistemas en los que se vaya a testear, habrá que configurar los dispositivos para que se puedan comunicar entre ellos. La forma más fácil y rápida es hacer un ping entre dispisitivos a ver si devuelve datos. Si devuelve paquetes el ping no hay que configurar nada (Como es el caso de la coenxión wsl - windows)

Luego de eso es que podemos hacer la conexión.

El paquete para configurar el servidor ssh en ubuntu y CentOS es `openssh-server`.

## conectarse a servidor ssh

Ya configurado el servidor, estando en la misma red, con el comando `ssh` que ya suele venir incorporado en la mayoria de sistmeas operativos y de distribuciones, de la siguiente forma: `ssh <usuario>@<hostname|ip>`

Al ejecutar todo, se te pedirá que te logees con las credenciales de usuario de esa máquina el cual se usará para poder acceder a la misma. Luego, si es la primera vez que te conectas a ese servidor, en el dispositivo cliente, se te va a preguntar si deseas almacenar el `fingerprint` siendo esta una pieza de seguridad que veremos más en detalle en otra sección.
