# Secure Shell

Como ya sabemos, ssh permite la conexion configable y segura a un servidor a traves de internet. Este protocolo permite que los datos que se comunican entre cliente y servidor esten encriptados, mejorando la seguridad y la privacidad de la comunicación entre cliente y servidor.

Por otro lado, este protocólo junto a otros, permiten que puedan interactuar otros protocolos como SCP (Secure Copy Protocol) y SFTP (Secure File Transfer Protocol). Además de permitir `tunneling` de forma segura bajo los protocolos (X11,VNC).

Para conectarse a una máquina a traves de un servidor ssh debemos tener 2 piezas indispensables.

1. Servidor SSH configurado en la máquina a la cual queremos acceder.
1. Cliente SSH que permita conectarse a la máquina. (En su mayoría, suele venir preinstalado en los equipos)

Es posible tener ambos tanto cliente como servidor en el mismo dispositivo, por lo que usaremos esta caracteristica para hacer las prácticas en local sin necesidad de tener que contratar un servidor o configurar uno.
