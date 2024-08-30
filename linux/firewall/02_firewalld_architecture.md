# Arquitectura de firewalld

En esta sección veremos en detalle la arquitectura de firewalld y las principales caracteristicas que este nos ofrece.

De más bajo nivel a más alto podemos indicar que firewalld tiene la siguiente estructura:

- Linux Kernel: Es la capa del kernel que maneja y filtra los paquetes que nuestra máquina esta recibiendo.

- Firewalld backends: Por encima de este utiliza iptables para sistemas antiguos o legacy, aunque esta próximo de deprecarse también de este paquete. Por otra parte, ya esta soportado el paquete de nftables el cual es el sucesor más moderno de iptables el cual nos permite manejar las reglas en cuestión de manera mucho más sencilla y conveniente. En sí, estas piezas son las que se comunican con el kernel directamente para realizar las operaciones.

- Firewalld Daemon: Por encima del backend, tenemos las piezas del demonio de firewalld que permite configurarse con el sistema operativo para poder utilizar las herramientas de este paquete.

- CLI Tools: Con el demonio tenemos acceso a las herramientas `firewall-cmd` y `firewall-config` el cual son interfacez que nos permiten interactuar de manera más sencilla con las diferentes piezas que se encargan de comunicarse con el subsystem del kernel para manejar las reglas para estos.

## Caracteristicas de firewalld

Por defecto firewalld bloquea todas las conexiones TCP y UDP, exceptuando las que de por si estan permitidas por el sistema de manera predeterminada como los puertos 22, 546, el puerto ipv6. Por otra parte, los puertos ICMP estan bloqueados por defecto para evitar ataques que vayan dirigidos directamente a estos puertos.


