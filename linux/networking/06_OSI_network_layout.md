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

## Subnet Mask

La subnetmask es una forma que tienen las redes de aislar los dispositios de una red de otras redes. Suele tener una nomenclatura similar a la siguiente 255.255.255.0. Esto permite aplicar una regla de `logical AND` a la ip de fuente y destino el cual si la regla aplica, permite enviar un paquete de una interfaz dentro de la misma subnet.

Las máscaras de red se componen de una IP de 32 bits seguidos por tantos 1 como amplia sea la máscara en bits. EJ: la mascara `255.255.255.0` es igual a `11111111.11111111.11111111.00000000`. Hay que tener encuenta que las máscaras, se componen de `1` consecutivos hasta donde indique el CIDR, desde ese punto se empiezan a definir `0` hasta que se completen los 32 bits. Por lo que /24 indica que la posición donde empiezan a haber `0` es a partir de la posición 24, por lo que la subnetmask de /24 seria 255.255.255.0.

Las direcciones 192.168.1.0 suele indicar la ip del gateway de la red; y la dirección 192.168.1.255 indica la IP-BROADCAST la cual es utilizada para enviar mensajes a todos los dispositivos conectados a la red.

Una de las utilidades de las subnetmask es que ayuda a especificar el tamaño de una red. Ya sabiendo que la subnetmask es 255.255.255.0 sabes que hay disponibles 254 hosts; o si vemos una subnet 255.255.254. ya podemos intuir que esa red tiene mas de 500 hosts en la red.

## ¿Cómo podemos ver que dispositivos estan conectados a nuestra red?

Con wireshark, podemos detectar un broadcast en el protocolo ARP que al momento de conectarse a la red, pregunta por la ip que este disponible para poder conectarse a ella. hay que buscar por el protocolo ARP el texto "Who is <ip_addr>".

## Cambiar la dirección ip por una personalizada

Podemos modificar la dirección IP de nuestras interfaces utilizando el comando `ip addr add <ip_address>/<prefix_length> dev <interface>`. Con el comando anterior, podemos asignar una ip personalizada.

a su vez, podemos eliminar una dirección ip en el caso de que ya no la necesitemos con el comando `ip addr del <ip_address>/<prefix_length> dev <interface>`.

Cuando se añade una ip a una interfaz de forma manual, tenemos 2 direcciones por las cuales los dispositivos pueden comunicarse con nosotros. Al ejecutar el comando `ip addr show`, veremos que en la interfaz a la cual hemos añadido otra dirección ip, veremos que esta tiene 2 líneas que empiezan con `inet ... scope global dynamic/secundary`, en estas veremos la dirección ip que hemos añadido y por la cual también será posible comunicarnos con la interfaz a la cual se la hayamos añadido.  

### ¿Qué utilidades se le puede dar a esta caracteristica?

Poder crear y asignar ips de esta forma tiene ventajas a la hora de crear entornos virtualizados como el caso de docker, que necesita ip's diferentes para poder isolar las peticiones entre contenedores, si se gestionan multiples sitios o servicios dentro de una misma máquina, lo cual ayuda a aislar la configuración en cada una de ellas. En el caso de los nodos de un cluster, podemos utilizar esta caracteristica para poder manejar la comunicación y el balanceo de carga de los peticiones. Pero principalmente, ante todo, es por seguridad, de esta forma podemos aislar peticiones y podemos controlar de manera más segura las conexiones creando reglas para cada una de las ip's. 

Otra de las posibles utilidades es la de poder tener varias ip's para realizar pruebas ej. Balanceadores para comprobar que realmente se este equilibrando la carga.
