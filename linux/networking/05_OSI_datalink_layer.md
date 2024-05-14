# Data Link layer

En este punto ya tenemos en el layer anterior (physical layer) definida la conexión entre distintos nodos dentro de una red, ya definido esto debemos identificar de alguna forma de donde procede la información, a donde va dirigida, quien la envía etc. De este proceso en particular es en el que nos vamos a enfocar en esta sección.

En este punto también nos encargamos de recoger multiples bits y agruparlos en frames, estos frames no son más que grupos de bits. Los frames es la unidada en la que el data link layer mide las cosas.

El tamaño de los frames depende del protocolo que estemos utilizando pero suele estar por al rededor de 1500 bytes en el caso de ethernet.

## ¿Cual es el objetivo principal de este layer?

Su principal función es la de garantizar una comunicación confiable entre los dispositivos dentro de la misma red.

### Logical Link Control

Esta capa interna es la que se encarga de manejo de flujos y detección de errores es la capa intermedia entre Data Link Layer y Network Layer.

### Media Access Control (MAC)

En este punto definimos apartir del MAC del dispositivo, la identidad del emisor y el receptor de los frames.

## Encapsulación de bits

En resumida, en este punto se encarga el sistema de encapsular bits y volverlos frames para luego agregarles las direcciones MAC de los emisores y los receptores de los frames.

Alguno de los protocolos más conocidos que trabajan en base a este layer son `Ethernet y WiFi`.

## Ethernet IEEE 802.3

Este protocolo se compone de una familia de tecnologias usualmente interconectadas por una LAN desarrollada en los 70s.

Este protocolo se basa en separar datos en frames de usualmente 1.5kb de tamaño, aunque esto puede variar dependiendo de las necesidades de la LAN.

En estos frames se encuentra la información que queremos transferir entre dispositivos.
