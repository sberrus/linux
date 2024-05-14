# OSI physical layer

En este podemos encontrarnos con las siguientes capas internas:

- Capa física (Physical Medium):
En este layer podemos encontrarnos los componentes físicos que componen una red, ya sea mediante switches conectados mediante cables etherne, cables de fibra optica entre otros, router para conexiones inalambricas.

	- Capa da transmision de datos (Data Transmission):
En este layer nos encontramos con los componentes que se encargan de convertir los datos digitales en señales para transmitirlos por la red.

	- Capa de señalización (signaling):
Medienta esta capa se manejan todos los aspectos eléctricos que componen las transmisión de datos. Desde este punto las distintas piezas de hardware proporcionan niveles de voltaje, modulación y sincronización de corriente eléctrica para que sea interpretada por otros componentes a traves de la red.

	- Detección de errores (Error detection):
En este punto se encuentran distintos mecanismos para la detección de errores en la red.

- TLDR:
Aquí podemos encontrarnos con distintos componentes los cuales podemos comprobar para realizar tareas de reconocimiento y detección de errores.

## Manejando los dispositivos de red

Mediante software, nosotros podemos controlar los dispositivos de red que esten conectados a nuestro dispositivo. Por ejemplo, podemos apagar un dispositivo y deshabilitar las conexiones que este tenga. Para ello debemos hacer lo siguiente:

1. Identificamos el dispositivo que queremos inhabilitar con el comando `ip addr show`. Este comando nos devolvera un log con la inforamción de los distintos dispositivos de red que hay en nuestro sistema como el siguiente:

``` salida de comando ip addr show

14: eth0: <BROADCAST,MULTICAST,UP> mtu 1500 group default qlen 1
    link/ether a0:29:19:33:72:ad                                                                            inet 192.168.7.235/22 brd 192.168.7.255 scope global dynamic
       valid_lft 603101sec preferred_lft 603101sec
    inet6 fe80::a894:e4ed:b38b:e8a7/64 scope link dynamic
       valid_lft forever preferred_lft forever                                                          13: eth1: <> mtu 1500 group default qlen 1
    link/ether ac:74:b1:de:1b:87
    inet 169.254.97.236/16 brd 169.254.255.255 scope global dynamic
       valid_lft forever preferred_lft forever
    inet6 fe80::ffbb:7076:d266:2eca/64 scope link dynamic
       valid_lft forever preferred_lft forever

```

La nomenclatura de la salida significa lo siguiente:

- Los primeros dígitos es el indice de la unidad, este se refiere a la posición donde se encuentra alojada la unidad.

- La segunda columna se refiere al tag de la tarjeta, siendo esta la identificación, el socket y el puerto de la misma.

En estas podemos encontrarnos multiples etiquetas como por ejemplo: 

- lo (loopback): Esta tarjeta de red se encarga de tareas de pruebas.
- eth# (ethernet): Estas etiquetas suelen ser las relacionadas con las tarjetas de red.
- wlan, wlp#s# (Wireless Lan): Estas etiquetas suelen ser las relacionadas con las tarjetas de redes inalámbricas.

Desde linux se esta buscando a migrar el sistema anterior de etiquetado de interfaces de red para crear un estandar común que se espera que tenga la siguiente estructura:

- enpXsY: Ethernet (PCI bus X, slot Y).
- ensX: Ethernet (PCI hotplug slot X).
- enx<MAC>: Ethernet con dirección MAC específica.
- wlpXsY: WLAN (PCI bus X, slot Y).
- wlanX: Interfaz WiFi tradicional (menos común con el nuevo esquema).

También, dependiendo del caso, podemos encontrarnos con algunas etiquetas en equipos virtualizados que sean gateways de docker o de VM's que tengamos corriendo en nuestro sistema como `docker, docker_gwbridge, virtualbox, etc.`

Para poder deshabilitar una unidad hacemos uso del comando `ip link set dev <etiqueta> down` mediante esta podemos apagar esa unidad y dejará de recibir y enviar datos.

De esta forma, desde linux podemos modificar el comportamiento de la capa física de OSI.
