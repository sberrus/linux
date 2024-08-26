# Usando llaves públicas y privadas para autenticarse en servidor

Este es otro tipo de logeo que nos permite establecer conexiones ssh mediante el uso de llaves públicas y privadas. Esto es realmente útil para cuando por ejemplo queremos tener un servidor que sirva como máquina de salto y permita tener un solo punto de acceso al resto de máquinas o tener algunos equipos que esten más aislados y sea más complicado acceder a estos de forma remota.

## Configurando las llaves

Para utilizar este método de logeo, debemos primero crear un par de llaves `público-privada` mediante el uso del comando `ssh-keygen -t rsa -b 4096`. El cual podemos desglozar de la siguiente forma: 

`-t rsa`: Se refiere al tipo de encriptado que se va a usar para genera la llave pública.
`-b 4096`: La cantidad de bits que se van a utilizar para realizar la encirptación, a mayor este número, más complicado será desencriptar el cifrado mediante fuerza bruta, pero a costo de un mayor tiempo de computo para realizar la validación del mismo.

Este par de llaves se deben generar en el cliente, siendo el cliente la máquina que se va a conectar al servidor, el cual luego le pasaremos la llave privada la cual usará para validar que la llave pública que tiene el cliente, es válida.

Al momento de generar las llaves, también podemos definir una clave para las llaves, añadiendo una capa extra de seguridad para proteger las llaves en caso de robo de dichas claves. Sin la llave no será posible utilizar estas llaves.

Ya generadas el par de llaves, en el servidor que deseamos acceder, en el caso de servidores Linux, debemos añadir la llave pública al fichero `~/.ssh/authorized_keys`. Esto lo podemos hacer manualmente, modificando o creando el fichero en el caso de que no exista; o podemos hacerlo mediante el comando `ssh-copy-id -i <ruta llave pública> <usuario>@<hostname>`.

Dependiendo del caso, de forma predeterminada, el último string de la llave pública va a ser el usuario y el hostname de la máquina local que esta generando el par de llaves. Para modificar esto, debemos pasar la bandera `-C "<usuario>@<hostname>"` para definir el usuario que desamos que pueda acceder a nuestro servidor.

Ya configurado esto, podemos acceder directamente desde la máquina que tiene la llave privada si necesidad de utilizar la contraseña; ya el servidor va a detectar el par de llaves y lo va a dejar acceder sin problema.

## Desactivar el uso de claves para poder acceder al servidor

Podemos definir en el servidor que solo permita conectarse con clientes que cuenten con llaves privadas válidas. Esto permite añadir otra capa extra de seguridad la cual hace que el usuario que tiene acceso al sistema mediante el uso de las llaves, no pueda acceder desde otro dispositivo que no tenga las llaves de acceso. Si un atacante tiene la credencial de acceso para acceder, si esta opción esta deshabilitada, así tenga la credencial, no va a poder acceder sin tener las llaves válidas. Por lo que un atacante necesitará necesariamente tanto la llave como la contraseña si desea hacer daño al sistema. Esto junto a otras estrategias de ciberseguridad añaden más capas de seguridad a la misma.

Para configurar esto debemos modificando el fichero `/etc/sh/sshd_config` añadiendo la siguiente directiva: `PasswordAuthentication no`.
