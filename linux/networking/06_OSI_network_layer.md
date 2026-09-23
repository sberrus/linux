OSI Network Layer

La Network Layer (capa de red) es la capa 3 del modelo OSI.

En la capa anterior, Data Link, trabajábamos principalmente con la comunicación entre dispositivos dentro de un mismo enlace o red local mediante frames y direcciones MAC.

Pero ¿qué ocurre cuando el dispositivo al que queremos enviar información no está conectado directamente a nuestra red local?

En este punto entra en juego la capa de red.

Su función principal es permitir que los datos puedan viajar entre diferentes redes, utilizando mecanismos de direccionamiento lógico y enrutamiento.

El protocolo más importante de esta capa es IP (Internet Protocol).

---

Frames vs Packets

Una distinción fundamental entre las capas 2 y 3 es la unidad de datos que manejan.

Layer 2 → Frame
Layer 3 → Packet

Un frame contiene información necesaria para transportar datos a través de un enlace concreto.

Por ejemplo, un frame Ethernet contiene:

Source MAC
Destination MAC
Payload

Mientras que un paquete IP contiene, entre otras cosas:

Source IP
Destination IP
Payload

La diferencia fundamental es que las direcciones IP permiten identificar el origen y destino a nivel de red, haciendo posible que el paquete atraviese diferentes redes.

Las direcciones MAC, en cambio, tienen significado dentro del enlace de datos correspondiente.

---

¿Cómo viaja un paquete entre diferentes redes?

Supongamos que tenemos esta topología:

PC A
 │
 │ Ethernet
 ↓
Router A
 │
 │
 │ Internet
 ↓
Router B
 │
 │ Ethernet
 ↓
PC B

PC A quiere comunicarse con PC B.

El paquete IP contiene:

Source IP      → IP de PC A
Destination IP → IP de PC B

Sin embargo, para poder transmitir físicamente ese paquete, necesitamos encapsularlo en un frame.

En el primer enlace podemos tener:

Frame 1
┌───────────────────────────────────────┐
│ MAC A → MAC Router A                  │
│                                       │
│ IP A → IP B                           │
└───────────────────────────────────────┘

Cuando el router recibe el frame:

1. Comprueba que el frame está destinado a él.
2. Extrae el paquete IP.
3. Consulta su tabla de routing.
4. Determina cuál es el siguiente salto.
5. Vuelve a encapsular el mismo paquete IP en un nuevo frame.
6. Envía el nuevo frame por la interfaz correspondiente.

Por ejemplo:

PC A
 │
 │ Frame 1
 │ MAC A → MAC Router A
 ↓
Router A
 │
 │ Frame 2
 │ MAC Router A → MAC Router B
 ↓
Router B
 │
 │ Frame 3
 │ MAC Router B → MAC B
 ↓
PC B

La idea fundamental es:

«El paquete IP atraviesa la red extremo a extremo, mientras que los frames se utilizan para transportar ese paquete a través de cada enlace individual.»

Por eso las direcciones MAC pueden cambiar en cada salto, mientras que normalmente las direcciones IP de origen y destino permanecen iguales durante el recorrido.

---

Routers y Gateways

Un router es un dispositivo que conecta diferentes redes y decide por qué interfaz debe reenviar los paquetes IP.

Para tomar estas decisiones utiliza una tabla de routing.

Por ejemplo:

Network          Next Hop
192.168.1.0/24   directamente conectada
10.0.0.0/8      10.0.0.1
default          192.168.1.1

El gateway es el dispositivo al que se entrega el tráfico cuando necesitamos alcanzar una red que no está directamente conectada.

En una red doméstica, normalmente el router que proporciona acceso a Internet también actúa como default gateway.

Por ejemplo:

PC
 │
 │ 192.168.1.20
 ↓
Router
 │
 │ 192.168.1.1
 ↓
Internet

En este caso:

Default gateway = 192.168.1.1

---

Tabla de routing en Linux

Podemos consultar la tabla de routing del sistema mediante:

ip route show

Por ejemplo:

default via 192.168.4.1 dev eth0 proto kernel
192.168.4.0/22 dev eth0 proto kernel scope link src 192.168.7.235

Esta salida no muestra los paquetes que se han enviado.

Muestra las reglas que utiliza el sistema para decidir por dónde enviar los paquetes IP.

---

Ruta "default"

La línea:

default via 192.168.4.1 dev eth0

significa:

«Si no existe una ruta más específica para el destino, utiliza el gateway "192.168.4.1" a través de "eth0".»

Esta es la denominada default route.

Por ejemplo, si nuestro ordenador quiere comunicarse con:

8.8.8.8

y no existe una ruta específica para "8.8.8.8", utilizará:

192.168.4.1

como siguiente salto.

---

Ruta directamente conectada

La segunda línea:

192.168.4.0/22 dev eth0

indica que la red:

192.168.4.0/22

está directamente conectada a través de "eth0".

En este caso no necesitamos enviar el paquete a un router para llegar a un host de esa red.

Sin embargo, seguimos necesitando la capa 2 para transmitir el paquete.

Por ejemplo:

PC A
 │
 │ IP + Ethernet
 ↓
PC B

Si ambos están en la misma subred, el sistema puede determinar que el destino es local y utilizar mecanismos como ARP para descubrir la MAC correspondiente a la IP de destino.

---

Subnets

Una subnet (subred) es una división lógica de un espacio de direcciones IP.

Por ejemplo:

192.168.1.0/24

representa una subred IPv4.

Podemos dividir un espacio de direcciones mayor en varias subredes.

Por ejemplo:

192.168.0.0/24
192.168.1.0/24
192.168.2.0/24
192.168.3.0/24

Estas son cuatro subredes independientes desde el punto de vista del direccionamiento IP.

Las subredes permiten organizar y separar redes de forma lógica y pueden utilizarse para controlar el dominio de broadcast, el routing, la segmentación y la administración de la red.

«Una subred no debe entenderse simplemente como "una red dentro de otra red". Es una porción definida del espacio de direcciones IP mediante un prefijo de red.»

---

Comunicación dentro y fuera de una subnet

Supongamos que nuestro ordenador tiene:

IP:      192.168.1.10
Subnet: 192.168.1.0/24

Y quiere comunicarse con:

192.168.1.20

El sistema determina que:

192.168.1.20 ∈ 192.168.1.0/24

Por tanto, considera que el destino está en la misma subred.

En ese caso, el paquete IP se encapsula en un frame destinado directamente a la MAC del dispositivo correspondiente.

Pero si queremos comunicarnos con:

8.8.8.8

el sistema determina que el destino no pertenece a la subred local.

Entonces utiliza la default route y envía el frame al MAC del gateway.

Por tanto:

Destino local
    ↓
MAC del destino

Destino remoto
    ↓
MAC del gateway
    ↓
Router
    ↓
Otra red

---

Subnet Mask

La subnet mask indica qué parte de una dirección IPv4 corresponde al prefijo de red y qué parte queda disponible para identificar hosts dentro de esa subred.

Por ejemplo:

255.255.255.0

equivale a:

11111111.11111111.11111111.00000000

Esto corresponde a:

/24

El "/24" significa que los primeros 24 bits corresponden al prefijo de red.

Los 8 bits restantes corresponden a la parte de host.

11111111.11111111.11111111.00000000
<--------- 24 ---------> <---8--->
         network          host

---

CIDR

Actualmente es habitual expresar las máscaras mediante CIDR notation.

Por ejemplo:

192.168.1.0/24

El "/24" indica que los primeros 24 bits forman el prefijo de red.

Algunos ejemplos:

/8  → 255.0.0.0
/16 → 255.255.0.0
/24 → 255.255.255.0
/25 → 255.255.255.128
/26 → 255.255.255.192
/30 → 255.255.255.252

---

¿Cómo determina el sistema si un destino es local?

El sistema puede utilizar una operación lógica AND entre una dirección IP y la máscara de red.

Por ejemplo:

IP:
192.168.1.20

Mask:
/24
255.255.255.0

El resultado es:

192.168.1.0

Si otra dirección:

192.168.1.50

también produce:

192.168.1.0

significa que ambas direcciones pertenecen a la misma subred "/24".

De forma simplificada:

IP destino
    ↓
Aplicar máscara
    ↓
Comparar con la red local
    ↓
┌───────────────┴───────────────┐
│                               │
Misma red                   Otra red
│                               │
↓                               ↓
Comunicación local          Gateway

---

Network Address y Broadcast Address

En IPv4 existen determinadas direcciones con significado especial.

Para:

192.168.1.0/24

tenemos:

Network address:
192.168.1.0

Broadcast address:
192.168.1.255

La network address identifica la subred y normalmente no se asigna a un host.

La broadcast address permite enviar tráfico a todos los hosts del dominio de broadcast IPv4 correspondiente.

Por tanto:

«"192.168.1.0" no significa necesariamente "gateway".»

El gateway podría ser, por ejemplo:

192.168.1.1

pero esto es simplemente una convención frecuente, no una propiedad de la dirección.

---

Número de hosts

En una red IPv4 tradicional:

192.168.1.0/24

tenemos:

2^8 = 256 direcciones

Normalmente:

1 → network address
1 → broadcast address

por lo que quedan:

254 direcciones utilizables para hosts

Para:

192.168.0.0/23

tenemos 9 bits para hosts:

2^9 = 512 direcciones

y tradicionalmente:

510 hosts utilizables

Sin embargo, hay que tener cuidado: existen excepciones y casos especiales en IPv4, y las reglas no deben aplicarse mecánicamente a todos los prefijos.

---

¿Cómo podemos observar dispositivos de nuestra red?

Una herramienta como Wireshark permite capturar tráfico de red y observar protocolos como ARP.

ARP (Address Resolution Protocol) permite resolver una dirección IPv4 local en una dirección MAC.

Por ejemplo, un host puede necesitar conocer:

¿Quién tiene 192.168.1.1?

y enviar una petición ARP:

Who has 192.168.1.1?

El dispositivo que posee esa IP puede responder:

192.168.1.1 is at aa:bb:cc:dd:ee:ff

Es importante corregir una idea de los apuntes originales:

«ARP no se utiliza para preguntar qué IP está disponible para conectarse a una red.»

Eso es función de DHCP.

ARP sirve principalmente para descubrir la dirección MAC asociada a una dirección IPv4 dentro de un enlace local.

---

Configuración manual de direcciones IP

Linux permite añadir una dirección IP a una interfaz mediante:

ip addr add <ip>/<prefix> dev <interface>

Por ejemplo:

ip addr add 192.168.1.50/24 dev eth0

Podemos eliminarla mediante:

ip addr del 192.168.1.50/24 dev eth0

Después podemos comprobar las direcciones configuradas mediante:

ip addr show dev eth0

Una interfaz puede tener más de una dirección IP.

Por ejemplo:

eth0
 ├── 192.168.1.20/24
 └── 192.168.1.50/24

Esto no significa que tengamos dos interfaces físicas. Tenemos una única interfaz con varias direcciones IP.

---

¿Para qué puede ser útil tener varias IP?

Tener múltiples direcciones IP en una interfaz puede ser útil en determinados escenarios, por ejemplo:

- Configuraciones de servidores.
- Migraciones.
- Virtualización.
- Servicios que necesitan direcciones diferentes.
- Configuraciones de alta disponibilidad.
- Entornos de pruebas.
- Transiciones entre redes.
- Algunos sistemas de balanceo y clustering.

Sin embargo:

«Tener varias IP en una interfaz no proporciona aislamiento ni seguridad por sí mismo.»

Si necesitamos aislar tráfico entre servicios o redes, podemos utilizar mecanismos como:

- VLANs.
- Subredes.
- Routing.
- Firewalls.
- Network namespaces.
- Interfaces virtuales.
- Políticas de routing.

---

Inspeccionar rutas concretas

Podemos utilizar:

ip route get <destination>

para consultar qué ruta utilizaría el sistema para llegar a un destino determinado.

Por ejemplo:

ip route get 8.8.8.8

Podríamos obtener algo similar a:

8.8.8.8 via 192.168.1.1 dev eth0 src 192.168.1.20

Esto significa, simplificando:

Destino:
8.8.8.8

Gateway:
192.168.1.1

Interfaz:
eth0

IP de origen:
192.168.1.20

Si el destino está directamente conectado, podríamos obtener algo parecido a:

192.168.1.50 dev eth0 src 192.168.1.20

En ese caso no aparece un "via", porque el sistema considera que el destino es directamente alcanzable mediante esa interfaz.

---

Modificar la tabla de routing

Podemos añadir una ruta manualmente:

ip route add <network>/<prefix> via <gateway> dev <interface>

Por ejemplo:

ip route add 10.10.0.0/16 via 192.168.1.254 dev eth0

Esto indica que para llegar a:

10.10.0.0/16

se debe utilizar:

Gateway: 192.168.1.254
Interface: eth0

Para eliminarla:

ip route del 10.10.0.0/16 via 192.168.1.254 dev eth0

Estas rutas pueden ser muy útiles en entornos con varias redes, routers, VPNs, máquinas virtuales o configuraciones de laboratorio.

---

DHCP

DHCP (Dynamic Host Configuration Protocol) permite configurar automáticamente determinados parámetros de red de un dispositivo.

Entre estos parámetros pueden encontrarse:

- Dirección IP.
- Prefijo o máscara de red.
- Default gateway.
- Servidores DNS.
- Tiempo de concesión (lease).
- Otros parámetros de configuración.

DHCP no "crea" físicamente una dirección IP. El servidor DHCP administra un conjunto de direcciones que puede asignar temporalmente a los clientes.

---

Componentes de DHCP

DHCP Server

Es el servidor que administra las concesiones DHCP.

Puede mantener un pool de direcciones y asignarlas a los clientes.

En una red doméstica, esta función suele estar integrada en el router.

---

DHCP Client

Es el dispositivo que solicita la configuración de red.

Por ejemplo:

Laptop → DHCP Server

El cliente solicita una configuración y recibe una concesión.

---

DHCP Relay Agent

En redes más grandes, el servidor DHCP puede estar situado en otra red.

Como las peticiones DHCP iniciales utilizan broadcast y los routers normalmente no reenvían broadcasts, puede utilizarse un DHCP relay agent.

Su función es reenviar las solicitudes entre el cliente y el servidor DHCP.

---

¿En qué capa está DHCP?

DHCP es un protocolo de capa de aplicación.

Utiliza:

Application → DHCP
Transport   → UDP
Network     → IP
Data Link   → Ethernet / Wi-Fi
Physical    → medio físico

Por tanto, no es correcto clasificar DHCP como un protocolo de capa 4.

DHCP utiliza UDP como protocolo de transporte.

---

Proceso DHCP — DORA

El proceso clásico de obtención de una concesión DHCP se conoce como:

D → Discover
O → Offer
R → Request
A → Acknowledge

1. DHCP Discover

El cliente todavía puede no tener una dirección IP válida.

Por ello, inicia una búsqueda de servidores DHCP.

En IPv4, la solicitud inicial utiliza broadcast, normalmente con:

Destination IP:
255.255.255.255

Esto significa IPv4 limited broadcast.

No es la dirección del servidor DHCP.

---

2. DHCP Offer

Uno o varios servidores DHCP pueden responder ofreciendo una configuración.

La oferta puede incluir:

IP:
192.168.1.50

Subnet:
255.255.255.0

Gateway:
192.168.1.1

DNS:
...

---

3. DHCP Request

El cliente selecciona una oferta y solicita formalmente esa configuración.

---

4. DHCP Acknowledge

El servidor confirma la concesión.

La respuesta puede incluir el tiempo durante el cual el cliente puede utilizar la dirección.

Client
  │
  │ DHCP Discover
  ↓
Server
  │
  │ DHCP Offer
  ↓
Client
  │
  │ DHCP Request
  ↓
Server
  │
  │ DHCP ACK
  ↓
Client

---

Renovación de una concesión DHCP

DHCP no necesariamente se ejecuta únicamente cuando un dispositivo se conecta por primera vez.

Las direcciones se conceden durante un período determinado.

Antes de que termine la concesión, el cliente puede intentar renovarla.

Por eso, el comportamiento real puede incluir mensajes adicionales de DHCP durante la vida de la conexión.

---

Inspeccionando DHCP con systemd-networkd

systemd-networkd es un servicio de Linux que puede encargarse de configurar y administrar interfaces de red.

Podemos consultar sus logs mediante:

journalctl -u systemd-networkd

Esto puede ser útil para investigar problemas relacionados con:

- Interfaces.
- DHCP.
- Configuración de direcciones.
- Rutas.
- Conectividad.
- Cambios de estado de las interfaces.

Por ejemplo, si una interfaz no recibe una dirección IP mediante DHCP, los logs de "systemd-networkd" pueden proporcionar información sobre el proceso de configuración.

---

NetworkManager

NetworkManager es otro sistema utilizado para administrar conexiones de red en Linux.

Es especialmente habitual en distribuciones orientadas a escritorio, aunque también puede utilizarse en servidores.

Podemos consultar su estado mediante:

nmcli device status

y:

nmcli connection show

NetworkManager y "systemd-networkd" son alternativas de administración de red en muchos sistemas, aunque la configuración concreta depende de la distribución y del entorno.

No debemos asumir que una distribución concreta utiliza necesariamente uno de ellos: lo importante es comprobar qué gestor está activo en el sistema.

---

Ping e ICMP

"ping" es una herramienta utilizada para comprobar conectividad utilizando normalmente ICMP Echo Request y ICMP Echo Reply en IPv4.

Por ejemplo:

ping 8.8.8.8

El proceso simplificado es:

Host A
 │
 │ ICMP Echo Request
 ↓
Host B
 │
 │ ICMP Echo Reply
 ↓
Host A

Si recibimos una respuesta, podemos comprobar que existe conectividad entre ambos extremos y medir aproximadamente el RTT (Round Trip Time).

Sin embargo:

«Que "ping" no reciba respuesta no demuestra necesariamente que el host esté caído.»

Puede haber:

- Firewall.
- Filtrado de ICMP.
- Problemas de routing.
- Pérdida de paquetes.
- Problemas de conectividad.
- El destino puede estar configurado para no responder a ICMP.

Del mismo modo, que "ping" funcione no demuestra que todos los demás servicios del host funcionen correctamente.

---

Traceroute

"traceroute" permite intentar descubrir los saltos intermedios que atraviesa el tráfico hasta llegar a un destino.

Por ejemplo:

traceroute google.com

Una salida típica puede tener esta estructura:

1   192.168.1.1      1.2 ms   1.1 ms   1.3 ms
2   10.0.0.1         5.2 ms   5.1 ms   5.4 ms
3   ...

Cada línea representa un TTL (Time To Live) y, normalmente, tres sondas.

---

¿Qué significa cada columna?

Hop number

Indica el valor de TTL utilizado y, de forma práctica, el número de salto que estamos intentando descubrir.

1
2
3
4
...

Router IP / hostname

Es la dirección IP y, cuando se puede resolver, el nombre del dispositivo que respondió.

RTT

Los valores:

5.2 ms
5.1 ms
5.4 ms

son tiempos de ida y vuelta (Round Trip Time) de las sondas.

---

¿Cómo funciona traceroute?

Cada paquete IP contiene un campo llamado:

TTL — Time To Live

En IPv4, el TTL se decrementa en cada router que reenvía el paquete.

Por ejemplo:

TTL = 3

Router 1 → TTL 2
Router 2 → TTL 1
Router 3 → TTL 0 → descarta

Cuando un router recibe un paquete cuyo TTL se agota, normalmente descarta el paquete y puede enviar al origen un mensaje ICMP:

ICMP Time Exceeded

Traceroute utiliza este comportamiento para descubrir los routers intermedios.

---

Ejemplo

Primero puede enviar una sonda con:

TTL = 1

El primer router decrementa:

1 → 0

y devuelve:

ICMP Time Exceeded

Traceroute obtiene así información sobre el primer salto.

Después envía:

TTL = 2

El primer router lo reenvía:

2 → 1

El segundo router lo recibe:

1 → 0

y devuelve otro:

ICMP Time Exceeded

Traceroute ha descubierto el segundo salto.

El proceso continúa:

TTL 1 → Hop 1
TTL 2 → Hop 2
TTL 3 → Hop 3
TTL 4 → Hop 4
...

---

Los "* * *" de traceroute

Podemos encontrarnos con:

10   * * *

Esto no significa necesariamente que se haya perdido un paquete en ese punto.

Significa que traceroute no recibió una respuesta para esas sondas dentro del tiempo esperado.

Puede deberse a:

- Un firewall.
- Filtrado de ICMP.
- Rate limiting.
- Un router configurado para no responder.
- Pérdida real de paquetes.
- Otros mecanismos de filtrado.

Por eso es perfectamente posible encontrar:

1   192.168.1.1     1 ms
2   * * *
3   10.20.0.1       5 ms

y que la comunicación siga funcionando correctamente.

---

Interpretando RTT en traceroute

Hay que tener cuidado al interpretar los tiempos.

Supongamos:

1   192.168.1.1      1 ms
2   10.0.0.1        80 ms
3   20.0.0.1         5 ms

No podemos concluir automáticamente que el router del segundo salto está causando una latencia de 80 ms.

Los routers pueden tratar las respuestas destinadas a traceroute o ICMP con una prioridad menor que el tráfico normal.

Si un salto muestra un RTT elevado pero los siguientes vuelven a tener valores bajos, eso puede ser simplemente una consecuencia de cómo ese router procesa las sondas.

Un aumento de RTT que persiste en los siguientes saltos es más informativo para investigar dónde comienza una degradación de la ruta.

---

Routing loops

Un routing loop ocurre cuando un paquete queda atrapado entre routers que se reenvían el paquete entre sí debido a una configuración incorrecta de routing.

Por ejemplo:

Router A
   ↓
Router B
   ↓
Router C
   ↓
Router A
   ↓
Router B
   ↓
...

El TTL evita que un paquete permanezca indefinidamente en la red.

Sin embargo, que un router aparezca varias veces en un "traceroute" no demuestra por sí mismo que exista un routing loop.

Hay que analizar la secuencia completa de saltos y el comportamiento de la ruta antes de sacar esa conclusión.

---

Resumen de la Network Layer

La capa 3 puede resumirse mediante estos conceptos:

                 NETWORK LAYER
                       │
       ┌───────────────┼────────────────┐
       │               │                │
   IP Addressing     Routing          Packets
       │               │                │
       │               │                │
   Subnets         Routers         Encapsulation
       │               │                │
       └───────────────┼────────────────┘
                       │
                  Layer 2 Frame

La idea fundamental es:

«La capa 3 permite que los paquetes IP viajen entre diferentes redes. Los routers utilizan tablas de routing para decidir el siguiente salto. En cada enlace, el paquete IP se encapsula dentro de un frame de la tecnología de capa 2 correspondiente.»

Podemos visualizar todo el proceso así:

              NETWORK LAYER
                   │
             IP Packet
                   │
       ┌───────────┴───────────┐
       │                       │
   Source IP              Destination IP
       │                       │
       └───────────┬───────────┘
                   │
             Layer 2 Frame
                   │
                   ↓
                 Router
                   │
             Routing table
                   │
             Next hop / route
                   │
             New Layer 2 Frame
                   │
                   ↓
              Next Router
                   │
                  ...

La distinción que conviene tener completamente clara antes de pasar a Transport Layer es:

L2 — Data Link
    Frames
    MAC addresses
    Ethernet / Wi-Fi
    Switches
    Comunicación mediante enlaces

L3 — Network
    Packets
    IP addresses
    Routing
    Routers
    Comunicación entre redes

Y una última corrección conceptual especialmente importante: Internet no es una "subnet" de tu Wi-Fi. Tu red Wi-Fi doméstica es una red/subred privada que se conecta, mediante un router y un proveedor de Internet, con otras muchas redes. Internet es una interconexión de redes, no una única subred gigantesca.