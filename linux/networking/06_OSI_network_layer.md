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

## Inspeccionar las rutas

Primero veremos que hace el comando `ip route show` y que significa:

``` salida de comando ip route show

default via 000.000.000.000 dev eth0 proto kernel
000.000.000.000/20 dev eth0 proto kernel scope link src 172.24.32.104

```

La ip importante es la segunda la que tiene el tag de la interfaz y la que esta asociada a una subnet ya que esta es la que usa la red para identificar los paquetes a donde tienen que llegar.

con el comando `ip route get <ip>`, podemos ver la ruta que el sistema utiliza para llegar a una ruta en especifico, por ejemplo. Si vemos que una ruta empieza por `<ip> via <ip>...` muestra que es una ruta que necesita buscar esa ip a traves de un GW. Si no vemos ninguna via diferente, es que podemos acceder a ella directamente debido a que esta en la misma red.

En el caso de que por algún motivo querramos modificar el comportamiento de una ruta podemos añadir rutas diferentes al igual que podemso añadir ip's diferentes. Esto lo hacemos mediante los siguietnes comandos:

- Añadir ruta: ip route add <ip_dest> via <gateway> dev <interfaz>
- Eliminar ruta: ip route del <ip_dest> via <gateway> dev <interfaz>

Toda esta configuración es necesaria y útil para cuando tenemos redes bastante complejas los cuales necesitamos tener un control más preciso de a que rutas estamos accediendo dentro de nuestra red y a cuales deseamos que se acceda desde fuera.

De esta forma, puede haber un caso en el que por ejemplo, tenemos una subnet dentro de nuestra red que por las reglas de subnet mask, los paquetes que querramos enviar desde el dispositivo a la subnet dnetro de nuestra red, por las reglas de subnet mask, el sistema intente enviar estos paquetes mediante el gateway de acceso a internet. En el caso de que querramos enviar ese paquete a un dispositivo dentro de nuestra red, pero que no cumpla con las reglas de subnet mask, debemos hacer una nueva regla de route para que en lugar de utilizar la gw de internet, definamos la ip gw del router que contenga el dispositivo al cual queremos conectarnos.

## DHCP

Dynamic host configuration protocol o DHCP, es un mecanismo que tienen los dispostivos de red que, de manera automática, asignar la ip de los dispositivos que se conectan a la red. 

Consta de los siguientes componentes:

- DHCP Server: Es el manager general de este protocolo. Este se encarga de tareas como: almacenar las ip's en el pool de direcciones y también eliminarlas del mismo. En una red de hogar, por lo general, este proceso es manejado directamente desde el router.

- DHCP Client: Son los dispositivos que se conectan a la red y a los que el Server le asigna una ip. Este es el que tiene que solicitar una ip y puede también soltarla de ser necesario.

- DHCP Relay Agent: En el caso de redes complejas, este se encarga de redireccionar las peticiones de una red a una subnet, de manera que sirva de punto de acceso (GW) entre redes.

Tecnicamente, las gestiones que se encarga el protocolo DHCP se encuentra en el Layer 4, principalmente en los procesos relacionados UDP; pero también gestiona ciertos procesos pertenecientes a Layer 3.

### Procesos DHCP

DHCP tiene unos procesos a la hora de asignar, eliminar y comprobar ip's como los siguientes:

1. Discover: Lo primero que hace este protocolo, es enviar un mensaje de broadcast a toda la red con destino a `255.255.255.255`. Esta ip es especial ya que es la que utiliza el protocolo DHCP para escuchar emnsajes. Se podría imaginar como que es la ip del servidor DHCP aunque no es del todo correcto. El resto de dispositivos conectados a la red van a recibir este mensaje pero lo van a ignorar.

2. Offer: El servidor DHCP responde a la solicitud con una IP y la inforamción relacioada con la misma.

3. Request: Cuando el servidor devuelve una ip disponible, el dispositivo que esta solicitando dicha ip acepta la ip y la inforamción y manda un mensaje al servidor DHCP aceptando la nueva ip y su información.

4. Acknowledge: En este paso, el servidor DHCP recibe el mensaje request del dispositivo que esta solicitando la ip y el servidor manda un mensaje de `Acknowledge` informando que ha confirmado la asignación de la nueva ip y la duración que va a tener el dispositivo con la misma.

Este flujo se hace de esta manera cuando tenemos un dispositivo que queremos introducir nuevo en la red, en el caso de que queramos agregar un nuevo dispositivo a la red, el servidor DHCP va a recibir una `request` del dispositivo solicitando que se le vuelva a asignar la misma ip que tiene registrada anteriormente y luego se verá uin mensaje de `acknowledged`

## Inspeccionando DHCP systemd-networkd

`systemd-networkd` es una herramienta para realizar tareas de inspección de redes montada sobre networkd el cual permite realizar inspecciones del protocolo DHCP.

Usualmente, cuando un dispositivo se conecta a una red, este ejecuta el protocolo DHCP para realizar las tareas de asignación y gestión de las ips dentro de la red. A nivel de sistema, cuando un dispositivo bootea, suele disparar también este protocolo para que busque una red a la cual conectarse.

Para ver los logs de systemd-networkd podemos empezar viendo los logs de `journalctl -u systemd-networkd`. Con esta herramienta podemos hacer debug viendo que si todo parece estar en orden, podemos detectar un problema de red relacionado con DHCP. 

Este log nos muestra la información de los dispositivos y además, podemos ver las solicitudes y las interacciones que hace nuestro dispositivo con los servidores DHCP correspondientes.

Suele ser un punto de partida a la hora de hacer debug cuando se tienen problemas de red.

## Inpeccionando DHCP con NetworkManager

NetworkManager es otra herramienta que suelen tener ciertas distribuciones de Linux que se encargan de inspeccionar problemas relacionadso con la red. Suele estar presentes en distribuciones Linux CentOs o similares.

En aspectos generales, es una alternativa a systemd-networkd.

## Inspeccionando redes con la herramienta `ping`

Esta es otra herramienta que podemos utilizar para realizar inspecciones de la red.

Ping usa por debajo el protocolo ICMP (Internet Control Message Protocol) el cual utiliza para enviar paquetes `ICMP Echo request` al destinatario y si el destinatario soporta el protocolo ICMP (Casi todos lo soportan, suele haberse el caso de dispositivos que apagan este protocolo) devolvera una respuesta `ICMP Echo reply`.

Esta es una forma rápida de comprobar si dos nodos estan conectados, en el caso de que se envíe el ping y no vuelva, significa que por el camino pueden haber problemas (ICPM apagado, los dispositivos no estan coenctados, firewall bloqueando el tráfico, etc...).

## Mostrando la ruta entre nodos con ICMP

Una de las cosas que muestra el protocolo ICMP es mostrar el path entre los dispositivo, esto lo podemos hacer con la herramienta `traceroute`. Con esta herramienta podemos ver dicho camino que toman las request desde el emisor al receptor.

Con esta herramienta podemos ver dentro de la red donde estan los caminos donde se estan viendo afectados los tiempos de espera entre un nodo y otro. Identificamos los caminos mas lentos dentro de la ruta entre 2 nodos.

Este comando muestra la siguiente información: 

- Hop number: indica la posición del router en el path.
- Router IP address/hostname: Idnetifica el router intermediario (GW)
- RTT values: Los tiempos de respuesta de cada uno de los paths.

Estos valores nos ayudan a identificar potenciales problemas.

``` salida del comando traceroute google.com
traceroute to google.com (), 30 hops max, 60 byte packets
1  * * *
2  * * *
3  * * *
4  * * *
5  * * *
6  * ()  2.170 ms  2.338 ms
7   ()  3.060 ms  3.051 ms  2.827 ms
8  105.red-193-152-59.static.ccgg.telefonica.net ()  4.171 ms  4.150 ms  4.256 ms
9  245.red-217-124-115.static.ccgg.telefonica.net ()  4.209 ms  4.520 ms  4.170 ms
10  * * *
11  * * *
12   5.080 ms  4.924 ms  5.169 ms
13    5.167 ms  5.014 ms  5.005 ms
14   24.641 ms 142.251.231.147 (142.251.231.147)  24.001 ms 192.178.11
15   24.503 ms  24.025 ms  23.957 ms
16    23.737 ms  23.733 ms  23.729 ms
```

Viendo la salida anterior, podemos detectar lo siguiente: 

Antes que nada, las líneas que devuelven `* * *` se debe a que el router en cuestión no respondio a la solicitud, esto puede deberse a que no ha podido llegar a ese destino o que tiene deshabilitado el protocolo ICMP.

Luego, el primer dato que se observa es el hostname con su respectiva dirección IP la cual se esta llegnado.

`traceroute to google.com (172.217.17.14), 30 hops max, 60 byte packets` -> en esta línea podemos observar la ip que esta apuntando el dominio en ese momento, también podemos ver la cantidad máxima de hops que tiene la consulta (esto se puede modificar en los parámetros del comando) y el tamaño del paquete que estamos enviando.

### Mecanismo de comunicacion de traceroute

Primero debemos definir que es el TTL de el paquete IP. Este valor determina el tiempo de vida o los saltos que un paquete tiene de vida. Lo que hace es que el valor de TTL define la cantidad de veces que un paquete puede pasar por un router. Cuando un paquete pasa por un router, cada router decrementa esta valor en uno hasta que se agote el TTL, si el paquete se queda sin TTL, el router que reciba el TTL 1 va a descartarlo y el paquete desaparece de la red. Cuando un paquete muere, el router que descarta el paquete devuelve un paquete ICMP "Time Exceeded", indicando que el paquete se quedo sin TTL al pasar por ese router.

Lo que hace traceroute es definir en el paquete IP un tiempo de vida corto. Por ejemplo: Primero envia un paquete con TTL 1, lo que hace que al llegar al router, el paquete muere y por ende devuelve la inforamción del primer nodo que encuentra. Luego, manda un paquete con destino el cual hayamos definido con un TTL 2, y esto lo que hace es que pasa por el router, el router decrementa el TTL y luego va al siguiente nodo; este nodo mata al paquete y devuelve el ICMP "Time Exceeded" y asi sucesivamente.

De esta forma podemos obtener la inforamción de los paquetes y sus respectivas métricas.

### Cosas a tomar en cuenta

Una de las cosas que puedes tener en cuenta a la hora de inspeccionar los saltos usando tracerouter es que si ves altos tiempos de respuesta, puede que debas revisar el hosting o la configuración que tengas creada. También puede deberse a problemas de infraestructura (instalaciones en mal estado, equiupos desactualizados, intentar llegar a un servidor que se encuentra muy lejos geograficamente, etc.)

Los * indican que se han perdido paquetes en el camino o que el router no permite responder a esos paquetes (deshabilitado ICMP), 

Podemos ver también que se repite en multiples ocasiones que se intenta llegar a un mismo host, esto puede deberse a problemas de `Routin Loops` y es posible que tu IS este teniendo problemas a la hora de redireccionar los paquetes. 
