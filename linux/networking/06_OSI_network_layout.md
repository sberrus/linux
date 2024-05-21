# Network Layout

Viendo lo anterior, sabiendo que para que en el layer 2, necesitemos estar directamente conectados ya semediante conexión directa o mediante algún switch, ¿como hacemos para cuando tenemos conexiones que no estan directamente conectadas?

En este layer, ya no hablamos de frames sino de paquetes, la principal diferencia entre un paquete y un Frame es que un paquete tiene información relacionada con la dirección a la cual va a ir dirigido.

En el caso de los frames, este tiene un MAC emisor y un MAC receptor a la hora de identificar para quien y desde donde se esta enviando un Frame. En el caso de los paquetes, estos se identifican mediante direcciones IP. Además, estos pueden ser redirigidos desde un dispositivo a otro. 

Los paquetes luego de manera local se transforman el Frames que son utilizados para transmitir los datos.

El flujo, de manera sencilla podría decirse que un dispositivo envía un frame que lo recoge el `router` y este lo empaqueta para ser transmitido por la red; luego este es recolectado por otro `router` que vuelve a convertirlo en un Frame.

Para revisar los paquetes que se han enviado, podemos hacer uso del comando `ip route show` el cual muestra la siguiente inforamción.

``` salida comando ip route show
none default via 192.168.4.1 dev eth0 proto unspec metric 0
none 192.168.4.0/22 dev eth0 proto unspec metric 256
none 192.168.7.235 dev eth0 proto unspec metric 256
none 192.168.7.255 dev eth0 proto unspec metric 256
none 224.0.0.0/4 dev eth0 proto unspec metric 256
none 255.255.255.255 dev eth0 proto unspec metric 256
```

Hay que tomar en cuenta lo siguiente:

la primera linea `default` es la ruta que toman todos los paquetes salientes de mi dispositivo el cual van para internet. Por lo general, esta es la ruta del router en el caso de que estes conectado a una red inalámbrica.

Por lo general, dependiendo de como este montado el sistema, la ip a donde apuntan las conexiones fuera de nuestra red, se llama Gateway, por lo que el router en el caso anterior, sería el Gateway de la red.

## Subnets

Las subnets son redes dentro de otras redes. Esto nos permite dentro de una red en la cual estan conectadas múltiples máquinas, separarlas en grupos, de manera que si vemos que hay congestión en la red, podemos hacer subnets para que los paquetes vayan mejor dirigidos y eviten colapsarla.

Para que esto quede claro tenemos que entender que para que una máquina se comunique con otra dentro de la misma red, se comunican mediante `frames`, en el caso de que se vayan a comunicar vía internet, se comunican vía paquetes.

Para simplificar, una subnet es una red dentro de otra red, por lo que una red wifi domestica es una subnet de internet y así... 
