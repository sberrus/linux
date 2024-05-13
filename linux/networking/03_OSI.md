# Open System Interconnection (OSI) model

Es un modelo de trabajo el cual define un standard para la comunicación y conexión de máquinas en una red.

Este modelo se basa en la estandarización en las comunicaciones entre dispositivos y consta de 7 capas que conforman el modelo.

Esto se tuvo que hacer de esta forma debido a que en los 80 habían muchisimos protocolos y esto hacia innecesariamente compleja la tarea de trabajar con redes, además, esto nos permite realizar tareas de investigación en redes de manera más sencilla.

Este modelo se basa en capas, que van desde la capa de hardware a todas las capas de software asociadas al modelo de comunicación OSI.

En las descripciones iremos de abajo hacia arriba yendo desde las capas de hardware a las capas de software yendo desde lo más de bajo nivel hasta la capa de aplicación que es con la que interactuamos directamente.

--- HOST LAYERS ---
7- Aplication layer: En esta capa nos encontramos la capa de interfaces por la cuales nosotros interactuamos y nos comunicamos a traves de la red. (HTTP,FTP,SMTP).
6- Presentation Layer: En esta se encriptan, se traducen y se comprimen los datos para transmitirlos por la red para que sean consumidas por las aplicaciones de la red. (TLS/SSL).
5- Session Layer: En esta nos encontramos las sesiones de las conexiones, como se crean, como se finalizan, cuando se crean entre otras.
4- Transport layer: En esta nos podemos econtrar con los protocolos de comunicación entre dispositivos los cuales se encargan de proporcionar las reglas de transmisión de datos entre dispositivos.(TCP,UDP).

--- MEDIA LAYERS ---
3- Network layer: En esta es la que se encarga de la intercomunicación de nodos dentro de la red, mediante esta es como somos capaces de comunicarnos con otro hub que esta en otra ciudad u otro pais. (IP)
2- Data link Layer: Se trata de la capa de transmisión de datos sin errores entre distintos nodos en una red adyacente. Básicamente es la capa donde ocurren las transmisiones de datos dentro de una red. Dentro de las capas de software es la capa de más bajo nivel. (Ethernet, MAC addresses, etc.)
1- Physical layer: En esta se transmiten físicamente los datos dentro de la red. (cables, switches, etc.)
