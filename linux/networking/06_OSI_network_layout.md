# Network Layout

Viendo lo anterior, sabiendo que para que en el layer 2, necesitemos estar directamente conectados ya semediante conexión directa o mediante algún switch, ¿como hacemos para cuando tenemos conexiones que no estan directamente conectadas?

En este layer, ya no hablamos de frames sino de paquetes, la principal diferencia entre un paquete y un Frame es que un paquete tiene información relacionada con la dirección a la cual va a ir dirigido.

En el caso de los frames, este tiene un MAC emisor y un MAC receptor a la hora de identificar para quien y desde donde se esta enviando un Frame. En el caso de los paquetes, estos se identifican mediante direcciones IP. Además, estos pueden ser redirigidos desde un dispositivo a otro. 

Los paquetes luego de manera local se transforman el Frames que son utilizados para transmitir los datos.

El flujo, de manera sencilla podría decirse que un dispositivo envía un frame que lo recoge el `router` y este lo empaqueta para ser transmitido por la red; luego este es recolectado por otro `router` que vuelve a convertirlo en un Frame.
