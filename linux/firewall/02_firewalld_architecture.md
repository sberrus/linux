# Arquitectura de firewalld

En esta sección veremos en detalle la arquitectura de firewalld y las principales caracteristicas que este nos ofrece.

De más bajo nivel a más alto podemos indicar que firewalld tiene la siguiente estructura:

- Linux Kernel: Es la capa del kernel que maneja y filtra los paquetes que nuestra máquina esta recibiendo.

- Firewalld backends: Por encima de este utiliza iptables para sistemas antiguos o legacy, aunque esta próximo de deprecarse también de este paquete. Por otra parte, ya esta soportado el paquete de nftables el cual es el sucesor más moderno de iptables el cual nos permite manejar las reglas en cuestión de manera mucho más sencilla y conveniente. En sí, estas piezas son las que se comunican con el kernel directamente para realizar las operaciones.

- Firewalld Daemon: Por encima del backend, tenemos las piezas del demonio de firewalld que permite configurarse con el sistema operativo para poder utilizar las herramientas de este paquete.

- CLI Tools: Con el demonio tenemos acceso a las herramientas `firewall-cmd` y `firewall-config` el cual son interfacez que nos permiten interactuar de manera más sencilla con las diferentes piezas que se encargan de comunicarse con el subsystem del kernel para manejar las reglas para estos.

## Caracteristicas de firewalld

Por defecto firewalld bloquea todas las conexiones TCP y UDP, exceptuando las que de por si estan permitidas por el sistema de manera predeterminada como los puertos 22, 546, el puerto ipv6. Por otra parte, los puertos ICMP estan bloqueados por defecto para evitar ataques que vayan dirigidos directamente a estos puertos.

<<<<<<< HEAD
## Interactuar con las CLI

Con firewalld tenemos distintos namespacees para ciertos servicios los cuales nos permiten definir reglas para los puertos dependiendo de el namespace que tenga. De manera predeterminada, por ejemplo, el puerto ssh es el 22, por lo que si queremos abrir dicho puerto, no necesitamos saberlo, con definir directamente por el namespace es suficiente.

Para ver todos los namespaces disponibles usamos el comando `firewall-cmd --get-services`.
Si queremos ver la información de ese namespace, podemos hacer uso del comando `firewall-cmd --info-sevice <namespace_del_servicio>`; de esta forma podemos ver la información del puerto que usa ese namespace y distintos parámetros que tiene este.

=======
## Configurar reglas de firewall
>>>>>>> 882be5c (Changes to firewall clasess)

Para añadir una regla (Hasta el siguiente reincio):

- `firewall-cmd --add-service=<service_name>`
- `firewall-cmd --add-port=<port>/<protocol>`

**Para que los cambios sean de manear permanente, debemos pasar la flag --permanent para que se mantenga inclusive si se reinicia el sistema**

De esta forma podemos definir reglas para poder abrir puertos y permitar la comunicación mediante estos.

Por otro lado, para cerrar puertos haremos uso de los sigueitnes comandos.

- `firewall-cmd --remove-service=<service_name>`
- `firewall-cmd --remove-port=<port>/<protocol>`

**Para que los cambios sean de manear permanente, debemos pasar la flag --permanent para que se mantenga inclusive si se reinicia el sistema**

## zonas en firewalld

Las zonas son una forma que tenemos de definir ciertas reglas que podemos usar a la hora de conectarnos a una red. Con el uso de las zonas podemos definir ciertas reglas para cuando estamos en una red pública, una privada, en la escuela, en el cole, etc... Con estas reglas podemos abrir y cerrar puertos dependiendo de nuestras necesidades y los accesos que necesitemos otorgar al tráfico que va a nuestra red.

Para obtener las zonas, debemos hacer uso del comando `firewall-cmd --get-zones`

Sabiendo que zonas tenemos configuradas, podmeos hacer uso del siguiente comando para saber que reglas tienen definidas con `firewall-cmd --zone=work --list-all` de esta forma podemos ver las diferentes configuraciones que tiene una zona.

Para ver las configuraciones qeu tiene el demonio por defecto lo hacemos mediante el siguiente directorio `/usr/lib/firewalld/zones/*`. Si queremos añadir manualmente una nueva zona, debemos irnos al directorio `/etc/firewalld/zones/` y en este definiremos un fichero con la siguiente estructura.

```
<?xml version="1.0" encoding="utf-8"?>
<zone>
    <short>My zone</short>
    <description>Here you can describe the characteristic features of the zone.</description>
    <service name="ssh"/>
    <port port="1025-65535" protocol="tcp"/>
    <port port="1025-65535" protocol="udp"/>
</zone>
```

La estructura básica del fichero es la que se ve arriba, en este podemos ver cosas como el formato del xml, luego la etiqueta ´zone´ indicando el dominio de dicha zona; y dentro de esta podemos añadir manualmente los distintos servicios que necesitemos definir.

Por defecto, utilizamos las reglas `Public` los cuales tienen las reglas suficientes para poder estar tranquilos a la hora de estar conectados a una red pública.

Para saber que zona tenemos configurada por defecto lo hacemos mediante `firewall-cmd --get-default-zone`

Podemos cambiarla haciendo uso del comando `firewall-cmd --set-default-zone=<zona>`

Al listar una zona que estamos utilizando, podemos ver que la interfaz de red se suscribe a esta y podemos verla listada en la propiedad `interfaces` de la zona.

Podemos de forma manual, definir servicios temporales para una zona haciendo uso del comando `firewall-cmd --zone=<zone> --add-service=<service>`.

Esto nos ayuda a la hora de definir las reglas para esa zona. Esto debemos tener encuenta qeu solo afecta a la zona hasta que se reinicie le sistema, al reiniciarse se vuelve a las reglas que se encuentran definidas en los ficheros .xml.
