# Data Link layer

En este punto ya tenemos en el layer anterior (physical layer) definida la conexión entre distintos nodos dentro de una red, ya definido esto debemos identificar de alguna forma de donde procede la información, a donde va dirigida, quien la envía etc. De este proceso en particular es en el que nos vamos a enfocar en esta sección.

En este punto también nos encargamos de recoger multiples bits y agruparlos en frames, estos frames no son más que grupos de bits. Los frames es la unidada en la que el data link layer mide las cosas.

El tamaño de los frames depende del protocolo que estemos utilizando pero suele estar por al rededor de 1500 bytes en el caso de ethernet.

## ¿Cual es el objetivo principal de este layer?

Su principal función es la de garantizar una comunicación confiable entre los dispositivos dentro de la misma red.

### Logical Link Control

Esta capa interna es la que se encarga de manejo de flujos y detección de errores es la capa intermedia entre Data Link Layer y Network Layer.


## Encapsulación de bits

En resumida, en este punto se encarga el sistema de encapsular bits y volverlos frames para luego agregarles las direcciones MAC de los emisores y los receptores de los frames.

Alguno de los protocolos más conocidos que trabajan en base a este layer son `Ethernet y WiFi`.

## Ethernet IEEE 802.3

Este protocolo se compone de una familia de tecnologias usualmente interconectadas por una LAN desarrollada en los 70s.

Este protocolo se basa en separar datos en frames de usualmente 1.5kb de tamaño, aunque esto puede variar dependiendo de las necesidades de la LAN.

En estos frames se encuentra la información que queremos transferir entre dispositivos. Además de algunos checksums que ayudan al receptor a saber si la información ha sido recibida correctamente, también contiene información de MAC de la interfaz que ha realizado el envío de la información y el receptor de la misma.

## WiFi IEEE 802.11

Este protocolo de comunicaciones es similar al Eternet 802.3, con la diferencia de que este se transmite por el aire sin necesidad de conexión cableada entre los nodos. 

Además de la inforamción que también transmite Ethernet, además contiene información relacionada con la red inalámbrica.

A grandes rasgos comparten la misma inforamción solo que cambián el medio por el cual lo transmiten. Se encarga de traducir Ethernet frames a WiFi frames; pero en escencia, son lo mismo.

## Media Access Control (MAC)

En este punto definimos apartir del MAC del dispositivo, la identidad del emisor y el receptor de los frames.

Es una dirección de 48-bit (6-byte), que consta de un valor hexadecimal dividido en 6 fragmentos de 2 dígitos por fragmento separados por `:` eg: a0:21:19:73:22:ad.

Los MAC tienen la siguiente estructura:

Los primeros 3 bytes contiene la información del manufacturador y los últimos 3 contienen el identificador del dispositivo.

Usualmente suelen ser valores estáticos, pero hay ciertos dispositivos que permiten modificar el mac address mediante el sistema haciendo algo que se llama `spoofing`.

Cada una de las interfaces que componen nuestro dispositivo tienen su propia dirección MAC.
