OSI Physical Layer

La capa física (Physical Layer) es la capa 1 del modelo OSI. Su función principal es transmitir una secuencia de bits mediante señales físicas a través de un medio de transmisión.

Esta capa define las características necesarias para representar y transportar los bits, como las características eléctricas, ópticas o radioeléctricas de la comunicación.

Es importante distinguir entre la capa física y los dispositivos de red completos. Un switch, un router o una tarjeta de red pueden contener componentes que trabajan en distintas capas del modelo OSI. Por ejemplo, un switch Ethernet opera principalmente en la capa 2, aunque sus puertos también incorporan componentes de capa física.

Conceptos de la capa física

Aunque el modelo OSI no divide la capa física en subcapas oficiales, podemos estudiar su funcionamiento mediante varios conceptos.

Physical Medium — Medio físico

Es el medio a través del cual se propagan las señales utilizadas para transmitir los datos.

Algunos ejemplos son:

- Cable de cobre.
- Fibra óptica.
- Ondas de radio.
- Otros medios de transmisión.

Por ejemplo, Ethernet puede utilizar cables de cobre o fibra óptica, mientras que Wi-Fi utiliza ondas de radio.

«Un cable Ethernet pertenece al medio físico. Un switch o un router, en cambio, son dispositivos de red que pueden implementar funciones de varias capas.»

---

Data Transmission — Transmisión de datos

La capa física define cómo se representan los bits mediante señales que pueden viajar por el medio físico.

Dependiendo de la tecnología utilizada, estas señales pueden ser:

- Eléctricas → cables de cobre.
- Ópticas → fibra óptica.
- Electromagnéticas → comunicaciones inalámbricas.

Por ejemplo, una tarjeta de red debe convertir los datos digitales que recibe de las capas superiores en señales apropiadas para el medio físico.

Este proceso se realiza mediante componentes electrónicos especializados, como los PHY (Physical Layer Transceivers).

---

Signaling — Señalización

La señalización define las características de las señales utilizadas para representar los datos.

Dependiendo de la tecnología, puede incluir aspectos como:

- Niveles eléctricos.
- Frecuencia.
- Temporización.
- Modulación.
- Codificación de señales.
- Sincronización.
- Características de transmisión y recepción.

Estos mecanismos permiten que el receptor pueda interpretar correctamente las señales que recibe.

Por ejemplo, en una conexión mediante fibra óptica, los bits se representan mediante variaciones de una señal óptica, mientras que en un enlace de cobre se utilizan señales eléctricas.

---

Error Detection — Detección de errores

La detección de errores no es una función general exclusiva de la capa física.

La capa física puede detectar determinados problemas relacionados con la transmisión de señales, pero mecanismos clásicos de detección de errores, como el FCS/CRC de Ethernet, pertenecen a la capa 2 (Data Link).

Por tanto, es más preciso considerar la detección de errores como una función que puede aparecer en diferentes capas dependiendo del protocolo utilizado.

---

TL;DR

La capa física se ocupa de cómo transmitir bits mediante señales físicas.

Podemos pensar en ella como la capa que responde a preguntas como:

- ¿Qué medio utilizamos?
- ¿Cobre, fibra o radio?
- ¿Cómo representamos un "0" y un "1"?
- ¿Qué características tiene la señal?
- ¿A qué velocidad se transmiten los bits?
- ¿Cómo se sincronizan emisor y receptor?
- ¿Cómo se envía físicamente la señal?

Los componentes relacionados con esta capa incluyen cables, conectores, antenas y circuitos físicos de transmisión y recepción.

---

Administración de interfaces de red en Linux

Linux permite administrar las interfaces de red mediante diferentes herramientas. Una de las más utilizadas actualmente es "ip", proporcionada por el paquete "iproute2".

Podemos utilizar:

ip addr show

para consultar las interfaces de red y sus direcciones configuradas.

Por ejemplo:

14: eth0: <BROADCAST,MULTICAST,UP> mtu 1500 group default qlen 1
    link/ether a0:29:19:33:72:ad
    inet 192.168.7.235/22 brd 192.168.7.255 scope global dynamic
       valid_lft 603101sec preferred_lft forever
    inet6 fe80::a894:e4ed:b38b:e8a7/64 scope link
       valid_lft forever preferred_lft forever

13: eth1: <> mtu 1500 group default qlen 1
    link/ether ac:74:b1:de:1b:87
    inet 169.254.97.236/16 brd 169.254.255.255 scope global dynamic
       valid_lft forever preferred_lft forever
    inet6 fe80::ffbb:7076:d266:2eca/64 scope link
       valid_lft forever preferred_lft forever

Interpretación básica

Una entrada como:

14: eth0: <BROADCAST,MULTICAST,UP> mtu 1500

contiene varios datos:

"14"

Es el índice de la interfaz dentro del sistema.

No indica necesariamente una "posición física" ni dónde está ubicada la tarjeta. Es simplemente un identificador numérico asignado por el kernel a esa interfaz.

"eth0"

Es el nombre de la interfaz de red.

El nombre identifica la interfaz que podemos utilizar en comandos como:

ip link show eth0

o:

ip link set dev eth0 down

"<BROADCAST,MULTICAST,UP>"

Son flags de la interfaz.

Por ejemplo:

- "BROADCAST" → la interfaz soporta tráfico de broadcast.
- "MULTICAST" → soporta multicast.
- "UP" → la interfaz está administrativamente habilitada.

"mtu 1500"

Indica el Maximum Transmission Unit (MTU).

Es el tamaño máximo, en bytes, de la unidad de datos que puede transmitirse por esa interfaz sin fragmentación en ese enlace concreto.

En Ethernet, "1500" bytes es un valor habitual para la MTU de IP.

"link/ether"

Indica que la interfaz utiliza una dirección de enlace Ethernet.

Por ejemplo:

link/ether a0:29:19:33:72:ad

es la dirección MAC de la interfaz.

La dirección MAC pertenece conceptualmente a la capa 2 (Data Link), no a la capa física.

---

Nombres de las interfaces de red

Linux puede utilizar diferentes esquemas para nombrar las interfaces.

Los nombres tradicionales incluyen:

eth0
eth1
wlan0

donde "eth" suele utilizarse para interfaces Ethernet y "wlan" para interfaces inalámbricas.

En muchas distribuciones modernas se utiliza el sistema de predictable network interface names, que intenta proporcionar nombres más estables y descriptivos.

Algunos ejemplos son:

enp3s0
ens33
enx001122334455
wlp2s0

Su significado depende del tipo de interfaz y de cómo haya sido identificada por el sistema.

Por ejemplo:

enp3s0

puede indicar una interfaz Ethernet asociada con una determinada posición en el bus PCI.

enx001122334455

indica una interfaz Ethernet cuyo nombre está basado en su dirección MAC.

En interfaces inalámbricas podemos encontrar nombres como:

wlp2s0

donde "wl" identifica una interfaz WLAN y el resto del nombre proporciona información sobre su ubicación dentro del sistema.

«Los nombres concretos dependen del sistema, del hardware y de la configuración. No debemos asumir que todas las interfaces Ethernet serán "enpXsY" ni que todas las interfaces Wi-Fi serán "wlpXsY".»

---

Interfaces virtuales

No todas las interfaces que aparecen en Linux representan una tarjeta de red física.

El sistema puede crear interfaces virtuales utilizadas por diferentes tecnologías y servicios.

Por ejemplo:

docker0

es una interfaz virtual que Docker puede utilizar para proporcionar conectividad de red a sus contenedores.

También podemos encontrar interfaces asociadas con:

- Máquinas virtuales.
- Contenedores.
- Bridges.
- VLANs.
- Túneles.
- VPNs.
- Interfaces virtuales creadas por aplicaciones.

Por tanto, al ejecutar:

ip addr show

podemos encontrar tanto interfaces físicas como interfaces virtuales.

---

Habilitar y deshabilitar interfaces

Podemos cambiar administrativamente el estado de una interfaz utilizando:

ip link set dev <interface> down

Por ejemplo:

ip link set dev eth0 down

Esto deshabilita administrativamente la interfaz.

Para volver a habilitarla:

ip link set dev eth0 up

Podemos comprobar su estado mediante:

ip link show eth0

o simplemente:

ip link show

Cuando una interfaz está "DOWN", el sistema deja de utilizarla para enviar y recibir tráfico a través de esa interfaz.

Sin embargo, esto no significa que hayamos "apagado la capa física de OSI". Estamos modificando el estado administrativo de una interfaz de red del sistema operativo, que a su vez puede provocar que el hardware de la interfaz deje de transmitir o recibir.

---

Relación con el modelo OSI

Es importante separar dos conceptos:

Modelo OSI:

7  Application
6  Presentation
5  Session
4  Transport
3  Network
2  Data Link
1  Physical

Administración de interfaces Linux:

ip addr
ip link
    ↓
Kernel / networking stack
    ↓
Network interface
    ↓
PHY / hardware
    ↓
Medio físico

Cuando ejecutamos:

ip link set dev eth0 down

estamos utilizando una interfaz del sistema operativo para modificar el estado de un recurso de red. Esto afecta a la comunicación, pero no equivale a ejecutar una operación definida por la capa 1 del modelo OSI.

El modelo OSI nos sirve para describir qué función realiza cada parte de una comunicación, mientras que comandos como "ip link" nos permiten administrar los recursos de red del sistema operativo.