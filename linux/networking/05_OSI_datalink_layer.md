OSI Data Link Layer

La Data Link Layer (capa de enlace de datos) es la capa 2 del modelo OSI.

Mientras que la capa física se encarga de transmitir bits mediante señales a través de un medio, la capa de enlace se encarga de organizar esos bits en unidades llamadas frames (tramas) y de proporcionar comunicación entre dispositivos que comparten un mismo enlace o tecnología de red.

En esta capa aparecen conceptos como:

- Frames.
- Direcciones MAC.
- Ethernet.
- Wi-Fi.
- Switches.
- Bridges.
- Detección de errores.
- Control de acceso al medio.

Una de las características fundamentales de esta capa es que trabaja con direcciones de enlace, como las direcciones MAC de Ethernet y Wi-Fi.

---

¿Cuál es el objetivo principal de este layer?

Su función principal es proporcionar una forma estructurada de intercambiar frames entre nodos conectados mediante un mismo enlace o tecnología de enlace de datos.

Para ello, la capa de enlace puede encargarse de funciones como:

- Encapsular datos procedentes de la capa 3 en frames.
- Añadir información de control.
- Identificar el origen y destino mediante direcciones de enlace.
- Controlar el acceso al medio.
- Detectar determinados errores de transmisión.
- Entregar los frames al siguiente componente de la red.

Es importante no decir que la capa 2 garantiza siempre una comunicación fiable. La fiabilidad depende del protocolo concreto.

Por ejemplo, Ethernet incorpora mecanismos para detectar frames corruptos, pero no retransmite por sí mismo una trama Ethernet que haya sido dañada.

---

Frames

La unidad de datos característica de la capa 2 es el frame (trama).

Las capas superiores generan datos que finalmente deben ser transportados por la red. La capa de enlace encapsula esos datos dentro de un frame.

De forma simplificada:

Datos de aplicación
       ↓
Segmento / Datagram (Layer 4)
       ↓
Paquete (Layer 3)
       ↓
Frame (Layer 2)
       ↓
Bits / señales (Layer 1)

Un frame puede contener, entre otros elementos:

+----------------+----------------+------------------+
| MAC destino    | MAC origen     | Datos            |
+----------------+----------------+------------------+
| Información de control / otros campos               |
+------------------------------------------------------+
| FCS / CRC                                           |
+------------------------------------------------------+

La estructura exacta depende del protocolo de capa 2.

---

Tamaño de los frames

El tamaño de un frame depende de la tecnología utilizada.

En Ethernet, un valor muy habitual es una MTU de 1500 bytes para IP, pero esto no significa que el frame Ethernet completo mida 1500 bytes.

En Ethernet II, por ejemplo, el frame contiene:

- Cabecera Ethernet.
- Payload.
- FCS.

Un frame Ethernet estándar puede tener hasta 1518 bytes, sin contar determinados elementos físicos de la transmisión como el preámbulo y el inter-frame gap.

Por tanto:

«1500 bytes suele referirse al MTU de IP sobre Ethernet, no al tamaño total del frame Ethernet.»

También existen tecnologías y configuraciones que permiten frames mayores, como los denominados jumbo frames.

---

Encapsulación

Una de las funciones fundamentales de la capa de enlace es encapsular los datos procedentes de la capa de red dentro de un frame.

Por ejemplo, si un paquete IP necesita transmitirse mediante Ethernet:

          Ethernet Frame
┌─────────────────────────────────────────┐
│ Ethernet Header                         │
│                                         │
│   Destination MAC                       │
│   Source MAC                            │
│   EtherType                             │
│                                         │
├─────────────────────────────────────────┤
│ IP Packet                               │
│                                         │
│   IP Header                             │
│   Payload                               │
│                                         │
├─────────────────────────────────────────┤
│ FCS / CRC                               │
└─────────────────────────────────────────┘

La capa 2 añade información necesaria para transportar el paquete mediante el enlace correspondiente.

---

Logical Link Control (LLC)

IEEE 802 históricamente dividió la capa de enlace de datos en dos componentes conceptuales:

- LLC — Logical Link Control
- MAC — Media Access Control

LLC está definido en IEEE 802.2 y proporciona funciones relacionadas con la identificación y multiplexación de protocolos de capa superior, además de determinados mecanismos de control.

Sin embargo, es importante no pensar en LLC como una "capa intermedia obligatoria" que todos los protocolos modernos utilizan de la misma forma.

En Ethernet moderno, por ejemplo, es habitual utilizar Ethernet II, donde el campo EtherType identifica directamente el protocolo encapsulado, como IPv4 o IPv6.

Por ello, para estudiar redes modernas resulta especialmente importante comprender MAC, frames y Ethernet, mientras que LLC es principalmente un concepto histórico y arquitectónico dentro del estándar IEEE 802.

---

Ethernet — IEEE 802.3

Ethernet es una familia de tecnologías de redes de área local (LAN) estandarizadas principalmente por IEEE 802.3.

Ethernet define, entre otras cosas:

- Formato de los frames.
- Direcciones MAC.
- Funcionamiento de la capa física asociada.
- Métodos de acceso al medio en determinadas variantes.
- Detección de errores mediante FCS.

Un frame Ethernet II simplificado tiene la siguiente estructura:

┌──────────────┬──────────────┬───────────┬──────────────┬─────────┐
│ Dest. MAC    │ Source MAC   │ EtherType │ Payload      │ FCS     │
└──────────────┴──────────────┴───────────┴──────────────┴─────────┘

Destination MAC

Indica la dirección MAC del destinatario del frame.

Source MAC

Indica la dirección MAC del dispositivo que originó el frame en ese enlace.

EtherType

Indica qué protocolo está encapsulado en el payload.

Por ejemplo:

0x0800 → IPv4
0x86DD → IPv6
0x0806 → ARP

Payload

Contiene los datos encapsulados, normalmente un paquete de una capa superior.

FCS

El Frame Check Sequence permite detectar determinados errores que hayan ocurrido durante la transmisión del frame.

---

Wi-Fi — IEEE 802.11

Wi-Fi está basado en la familia de estándares IEEE 802.11.

Al igual que Ethernet, utiliza direcciones MAC y frames de capa 2, pero el funcionamiento interno es diferente porque el medio de transmisión es inalámbrico.

Wi-Fi utiliza:

- Ondas de radio.
- Frames 802.11.
- Direcciones MAC.
- Mecanismos de acceso al medio.
- Información específica de la comunicación inalámbrica.

Por tanto, Ethernet y Wi-Fi tienen conceptos comunes porque ambos trabajan en las capas 1 y 2, pero sus frames no son idénticos y no debemos pensar en Wi-Fi simplemente como "Ethernet transmitido por el aire".

Una red puede utilizar Ethernet para conectar un dispositivo a un switch y Wi-Fi para conectar otro dispositivo a un access point.

Por ejemplo:

Laptop
  │
  │ Wi-Fi / 802.11
  ↓
Access Point
  │
  │ Ethernet
  ↓
Switch
  │
  ↓
Router

El access point puede actuar como puente entre el segmento inalámbrico y una red Ethernet.

---

Media Access Control — MAC

La parte MAC (Media Access Control) de la capa de enlace está relacionada con el acceso al medio y con el direccionamiento mediante direcciones MAC.

Una dirección MAC utilizada habitualmente en Ethernet es de 48 bits (6 bytes).

Por ejemplo:

a0:21:19:73:22:ad

Cada grupo representa un byte:

a0 : 21 : 19 : 73 : 22 : ad
│    │    │    │    │    │
1    2    3    4    5    6 bytes

---

Estructura de una dirección MAC

Tradicionalmente se suele explicar una MAC de 48 bits dividiéndola en:

┌────────────────────────┬────────────────────────┐
│      Primeros 24 bits  │     Últimos 24 bits   │
│          OUI           │ Identificador asignado │
└────────────────────────┴────────────────────────┘

Los primeros 24 bits pueden identificar al fabricante u organización que tiene asignado el bloque de direcciones.

Los últimos bits son asignados por esa organización.

Sin embargo, esta explicación tiene una importante excepción:

Las direcciones MAC pueden ser locally administered, es decir, administradas localmente y no necesariamente asignadas por un fabricante mediante un OUI tradicional.

Además, algunos sistemas operativos permiten modificar o aleatorizar la dirección MAC.

---

MAC Spoofing / MAC Address Randomization

Una interfaz de red normalmente tiene una dirección MAC configurada, pero esta dirección puede modificarse mediante software en determinados sistemas y dispositivos.

Cambiar la dirección MAC de una interfaz suele denominarse:

MAC spoofing

También existe la MAC address randomization, utilizada por algunos sistemas, especialmente en redes Wi-Fi, para reducir el seguimiento de un dispositivo mediante una dirección MAC permanente.

Por ejemplo, podemos encontrarnos con:

MAC física:
a0:21:19:73:22:ad

MAC configurada:
02:11:22:33:44:55

La dirección utilizada por el sistema no tiene por qué coincidir siempre con la dirección grabada originalmente en el hardware.

---

MAC por interfaz

Una máquina puede tener múltiples interfaces de red.

Por ejemplo:

eth0   → Ethernet
wlan0  → Wi-Fi
lo     → Loopback

Las interfaces que utilizan tecnologías de enlace como Ethernet o Wi-Fi tienen normalmente sus propias direcciones de enlace.

Podemos consultar información de las interfaces mediante:

ip link show

Por ejemplo:

2: eth0: <BROADCAST,MULTICAST,UP>
    link/ether a0:21:19:73:22:ad

Aquí:

link/ether

indica que estamos viendo una dirección de enlace Ethernet, y:

a0:21:19:73:22:ad

es la dirección MAC asociada a esa interfaz.

---

Captura de frames con Wireshark

Herramientas como Wireshark permiten capturar y analizar tráfico de red.

Cuando capturamos tráfico Ethernet podemos observar información de capa 2, como:

- MAC de origen.
- MAC de destino.
- EtherType.
- Contenido del frame.
- FCS, cuando está disponible.
- Paquetes encapsulados.

Por ejemplo:

Source:      a0:21:19:73:22:ad
Destination: 44:55:66:77:88:99
Type:        IPv4

Esto permite analizar cómo se comunican los dispositivos dentro de una red.

También podemos observar comunicaciones entre un host y el gateway, aunque debemos tener en cuenta que la MAC utilizada para enviar un paquete depende del siguiente salto (next hop), no necesariamente de la MAC del destino final.

Por ejemplo:

PC ──────── Switch ──────── Router ──────── Internet
          │
       Ethernet

Si el PC quiere comunicarse con un servidor situado en Internet, el frame Ethernet normalmente tiene:

Source MAC      = MAC del PC
Destination MAC = MAC del router/gateway

El router posteriormente crea un nuevo frame para el siguiente enlace.

Esto es una idea fundamental:

«Las direcciones MAC identifican dispositivos en el enlace local; las direcciones IP permiten identificar y alcanzar hosts a través de diferentes redes.»

---

Dispositivos de Data Link Layer

Algunos dispositivos que trabajan principalmente con funciones de capa 2 son:

Bridge

Un bridge conecta diferentes segmentos de una red y puede reenviar frames basándose en direcciones MAC.

Los switches modernos pueden considerarse una evolución de este concepto.

---

Switch

Un switch Ethernet conecta múltiples dispositivos dentro de una red y aprende qué dirección MAC puede alcanzarse a través de cada puerto.

Por ejemplo:

          Switch
       ┌────┼────┐
       │    │    │
      PC-A PC-B PC-C

El switch mantiene una tabla similar a:

MAC                    Puerto
--------------------------------
AA:AA:AA:AA:AA:AA      Port 1
BB:BB:BB:BB:BB:BB      Port 2
CC:CC:CC:CC:CC:CC      Port 3

Si PC-A quiere enviar un frame a PC-B, el switch puede consultar su tabla y reenviar el frame únicamente por el puerto correspondiente.

Esto evita enviar el tráfico unicast innecesariamente a todos los puertos.

---

Wireless Access Point

Un Wireless Access Point (AP) proporciona conectividad inalámbrica mediante IEEE 802.11.

En muchas redes actúa como puente entre una red Wi-Fi y una red Ethernet.

Por ejemplo:

Laptop
   │
   │ 802.11 / Wi-Fi
   ↓
Access Point
   │
   │ Ethernet
   ↓
Switch

---

Comunicación directa entre dispositivos

Dos dispositivos pueden comunicarse directamente mediante un enlace de capa 2.

Por ejemplo:

PC-A ───────────────── PC-B
       Ethernet

PC-A puede enviar un frame directamente a la MAC de PC-B.

En una red Ethernet basada en un medio compartido, otros dispositivos que recibieran físicamente la señal podían observarla y decidir si procesarla según la dirección de destino.

Sin embargo, las redes Ethernet modernas utilizan habitualmente switches, por lo que ya no funcionan como un único medio compartido en el que todos los dispositivos reciben todos los frames.

---

Switches y dominios de colisión

Los switches permiten dividir una red en diferentes segmentos de comunicación.

Por ejemplo:

       Switch
     ┌────┼────┐
     │    │    │
    PC-A PC-B PC-C

Cada puerto del switch constituye normalmente un dominio de colisión independiente.

En redes Ethernet modernas, los enlaces suelen funcionar en full-duplex, por lo que las colisiones tradicionales de Ethernet prácticamente han desaparecido.

Esto supone una mejora importante respecto a las antiguas redes Ethernet basadas en hubs y medios compartidos.

---

¿El switch conoce los dispositivos conectados?

Sí.

Un switch aprende las direcciones MAC observando la MAC de origen de los frames que recibe.

Por ejemplo:

PC-A → Switch
MAC origen = AA:AA:AA:AA:AA:AA

El switch puede aprender:

AA:AA:AA:AA:AA:AA → Port 1

Con el tiempo construye una MAC address table.

Cuando recibe un frame destinado a una MAC que conoce, puede reenviarlo únicamente por el puerto correspondiente.

Si no conoce todavía la MAC de destino, en un escenario Ethernet típico realiza flooding del frame por los puertos correspondientes al mismo dominio de broadcast, excepto por el puerto por el que recibió el frame.

Por este motivo, no es correcto decir que los demás dispositivos "no saben qué dispositivos están conectados al switch". Más precisamente:

«Los hosts normalmente no necesitan conocer la tabla MAC del switch. El switch mantiene esa información y la utiliza para tomar decisiones de forwarding.»

---

Broadcast, multicast y unicast

En una red de capa 2 podemos encontrar diferentes tipos de tráfico.

Unicast

Un origen envía información a un destino concreto.

PC-A ─────→ PC-B

Broadcast

Un frame está destinado a todos los dispositivos del dominio de broadcast.

En Ethernet se utiliza la MAC:

ff:ff:ff:ff:ff:ff

Multicast

Un frame está destinado a un grupo determinado de dispositivos.

Esto es utilizado por diferentes protocolos y aplicaciones que necesitan comunicación uno-a-muchos.

---

Resumen

La capa 2 se puede resumir en varios conceptos fundamentales:

                    DATA LINK LAYER
                           │
             ┌─────────────┴─────────────┐
             │                           │
          Framing                     MAC
             │                           │
       ┌─────┴─────┐             ┌──────┴──────┐
       │           │             │             │
    Frames      FCS/CRC       Addressing    Access
       │                           │          control
       │                           │
       └──────────────┬────────────┘
                      │
              Ethernet / Wi-Fi
                      │
                Switch / AP

La idea fundamental es:

«La capa física transmite bits mediante señales. La capa de enlace agrupa esos bits en frames y proporciona comunicación entre dispositivos mediante una tecnología de enlace concreta, utilizando mecanismos como las direcciones MAC, el control de acceso al medio y la detección de errores.»

Y la distinción con la capa 3 es:

Layer 2 → ¿Cómo entrego este frame dentro de este enlace/red local?
Layer 3 → ¿Cómo llego hasta otra red?

Por ejemplo:

PC A
 │
 │ Ethernet
 │ MAC
 ↓
Switch
 │
 │ Ethernet
 ↓
Router
 │
 │ IP
 ↓
Otra red
 │
 ↓
Servidor

En el enlace local utilizamos MAC y frames. Para atravesar diferentes redes utilizamos IP y paquetes.