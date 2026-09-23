Open Systems Interconnection (OSI) Model

El modelo OSI (Open Systems Interconnection) es un modelo conceptual desarrollado por la ISO para estandarizar y describir cómo se produce la comunicación entre sistemas dentro de una red.

El modelo divide el proceso de comunicación en 7 capas, donde cada capa tiene una función específica y proporciona servicios a la capa superior. Esta separación permite abstraer la complejidad de la comunicación y facilita el diseño, implementación, análisis y resolución de problemas en redes.

El modelo OSI surgió en un contexto en el que existían numerosos sistemas y protocolos de comunicación incompatibles entre sí. La estandarización mediante un modelo por capas permitió establecer una estructura común para describir las funciones necesarias para la comunicación entre sistemas.

Es importante destacar que OSI es principalmente un modelo de referencia, no una pila de protocolos que se utilice directamente en Internet. La arquitectura de protocolos de Internet se basa principalmente en el modelo TCP/IP, aunque los conceptos del modelo OSI siguen siendo muy utilizados para estudiar y describir las redes.

Las capas se organizan desde las funciones más cercanas al medio físico hasta las más cercanas a las aplicaciones:

7. Application
6. Presentation
5. Session
4. Transport
3. Network
2. Data Link
1. Physical

En los siguientes apartados se describen de abajo hacia arriba, desde las funciones relacionadas con la transmisión física de datos hasta las funciones que proporcionan servicios directamente a las aplicaciones.

---

HOST LAYERS

Las capas 4 a 7 se suelen asociar con funciones implementadas principalmente en los sistemas finales (hosts), aunque esta división no debe interpretarse como una separación física estricta.

7. Application Layer — Capa de aplicación

Es la capa que proporciona servicios de red directamente a las aplicaciones que utilizan los usuarios.

Aquí se encuentran los protocolos que permiten a las aplicaciones realizar operaciones concretas a través de la red, como solicitar una página web, transferir un archivo o enviar un correo electrónico.

Ejemplos:

- HTTP / HTTPS → navegación web
- FTP → transferencia de archivos
- SMTP → envío de correo electrónico
- DNS → resolución de nombres de dominio

«La capa de aplicación no es simplemente la interfaz gráfica con la que interactúa el usuario. Se refiere a los protocolos y servicios de red utilizados por las aplicaciones.»

---

6. Presentation Layer — Capa de presentación

Se encarga de definir cómo se representan y transforman los datos para que puedan ser interpretados correctamente entre sistemas.

Entre sus funciones conceptuales se encuentran:

- Traducción o transformación de formatos de datos.
- Codificación y representación de caracteres.
- Compresión y descompresión.
- Cifrado y descifrado.

Un ejemplo clásico sería la conversión entre diferentes representaciones de datos.

Ejemplos conceptuales:

- Codificaciones de caracteres.
- Formatos de serialización.
- Compresión.
- Cifrado.

«Nota: TLS/SSL suele asociarse con esta capa en representaciones del modelo OSI, pero en la arquitectura TCP/IP no existe una correspondencia estricta entre TLS y la capa 6 de OSI.»

---

5. Session Layer — Capa de sesión

Se encarga conceptualmente de establecer, mantener, sincronizar y finalizar sesiones de comunicación entre aplicaciones.

Entre sus funciones pueden encontrarse:

- Establecimiento de sesiones.
- Mantenimiento de sesiones.
- Finalización de sesiones.
- Sincronización y recuperación de determinadas comunicaciones.

En las implementaciones modernas de redes, muchas de estas funciones no aparecen como una capa independiente, sino que se integran en protocolos de otras capas.

---

4. Transport Layer — Capa de transporte

Proporciona comunicación extremo a extremo entre procesos que se ejecutan en distintos hosts.

Entre sus principales funciones se encuentran:

- Segmentación y reensamblado de datos.
- Multiplexación mediante puertos.
- Control de errores.
- Control de flujo.
- Control de congestión.
- Entrega fiable, cuando el protocolo utilizado la proporciona.

Ejemplos:

- TCP → transporte orientado a conexión y fiable.
- UDP → transporte no orientado a conexión y sin garantía de entrega.

La capa de transporte permite que diferentes aplicaciones que se ejecutan en un mismo dispositivo puedan utilizar simultáneamente la red.

---

MEDIA LAYERS

Las capas 1 a 3 están relacionadas principalmente con la transmisión de datos a través de la infraestructura de red.

3. Network Layer — Capa de red

Se encarga de proporcionar comunicación entre redes diferentes y de determinar cómo los paquetes pueden llegar desde un origen hasta un destino.

Entre sus principales funciones se encuentran:

- Direccionamiento lógico.
- Enrutamiento (routing).
- Reenvío de paquetes (forwarding).
- Interconexión de diferentes redes.

El ejemplo principal es IP (Internet Protocol).

Los routers operan principalmente en esta capa, utilizando direcciones IP para decidir hacia dónde reenviar los paquetes.

Por ejemplo, esta capa permite que un dispositivo de una red local pueda comunicarse con un dispositivo situado en otra red, incluso si ambas redes están separadas geográficamente.

---

2. Data Link Layer — Capa de enlace de datos

Se encarga de proporcionar comunicación entre nodos conectados directamente dentro de un mismo enlace o red local.

Entre sus funciones se encuentran:

- Encapsulación de paquetes en tramas (frames).
- Direccionamiento mediante direcciones de enlace, como las direcciones MAC en Ethernet.
- Detección de determinados errores de transmisión.
- Control del acceso al medio en determinadas tecnologías.

Ejemplos:

- Ethernet.
- Wi-Fi (IEEE 802.11).
- PPP.

Los switches Ethernet operan principalmente en esta capa, utilizando direcciones MAC para decidir por qué puerto reenviar las tramas.

«La capa 2 no garantiza necesariamente una transmisión "sin errores". Por ejemplo, Ethernet puede detectar errores mediante mecanismos como FCS, pero una trama corrupta normalmente se descarta en lugar de retransmitirse por el propio protocolo Ethernet.»

---

1. Physical Layer — Capa física

Es la capa encargada de la transmisión de bits mediante señales físicas a través de un medio de transmisión.

Define aspectos como:

- Características eléctricas, ópticas o radioeléctricas.
- Conectores y medios físicos.
- Modulación y señalización.
- Velocidad de transmisión.
- Representación de los bits mediante señales.

Ejemplos de medios:

- Cable de cobre.
- Fibra óptica.
- Ondas de radio.

«Un cable pertenece al medio físico, mientras que un switch no es propiamente un elemento de la capa física: un switch Ethernet opera principalmente en la capa 2, aunque el hardware del switch también contiene componentes correspondientes a la capa física.»

---

Una forma sencilla de recordar la función de cada capa es:

Application → qué quiere hacer la aplicación
Presentation → cómo se representan los datos
Session → cómo se mantiene la comunicación
Transport → cómo se comunican los procesos extremo a extremo
Network → cómo llegar a otra red
Data Link → cómo llegar al siguiente nodo
Physical → cómo transmitir los bits físicamente