# Transport Layer

Este layer prinpalmente se encarga de manejar el transporte de la inforamción, nos encontramos con problemas de el orden de los datos, como se envian, como se transmiten, manejar errores como ¿que pasa cuando de 10 paquetes uno intermedio se pierde en el camino? ¿como manejamos un paquete que tarda más de la cuenta?, entro otras cosas.

En este layer nos vamos a encontrar protocolos como UDP y TCP, ambos siendo protocolos que se encargan de gestionar los canales de comunicación y las conexiones entre dispositivos.

## Transmision Control Protocol

Este es un protocolo oritentado a la conexión, este protocolo se encarga de que la inforamción se transmita de forma ordenada, confiable y manejando los posibles errores que puedan ocurrir en la transmisión de datos entre dispositivos.

En este protocolo la idea general es la de crear un canal entre dos dispositivos, cuando se establece este canal, se procede a transmitir inforamción entre ellos y dentro de estos hay diversos mecanismos que controlan que tanta información se transmite, como se ordenan los paquetes que se transmiten mediante este canal, que se hace cuando ocurre algún error entre otras cosas. Lo que hace es que crea una abstracción para manejar los paquetes.

En este protocolo se manejan convenios entre destino y origen relacionado con el tamaño de los paquetes, el ancho de banda que van a utilizar, los TTL entre otras configuaciones que mediante un `handshake` o acuerdo, establecen un medio de comunicación y mediante este operan.

## Puertos en protocolos TCP/UDP

Los puertos son una forma que tenemos de identificar una conexión directa con un servicio que esta corriendo en una máquina. Es una forma de especififcar a que servicio en concreto un paquete va dirigido. Los puertos son un valor númerico de 16-bit en un rango entre 0-65535 puertos disponibles.

### Tipos de puertos

Existen tipos de puertos dependiendo de su naturaleza. 

- 0-1024: Estos puertos se suelen reservar para lsos servicios y protocolos estandarizados como HTTP(80), HTTPS(443), FTP(21), SSH(22), etc...

- 1024-49151: Estos puertos son los puertos registrados en Internet Assigned Numbers Authority (IANA). Por ejemplo: MYSQL(3306), POSTGRESQL(5432), VNC(5900), etc...

- 49152-65535: Resto de puertos no controlados por IANA.

Esto permite que se permitan en un mismo dispositivo multiples conexiones de multiples servicios sin que estos colisionen. Hay que tomar en cuenta que los puertos son de entrada y de salida. Por lo general los puertos de entrada son los puertos fijos que se les asigna a las aplicaciones para que los paquetes que vayan directamente a estos los puedan manejar corectamente; y luego tenemos los puertos de salida que suelen ser puertos que se asignan aleatoriamente para la transmision de paquetes desde un origen.

En los detalles de los paquetes TCP, se pueden observar tanto los puertos de entrada como los de salida.

### TCP three-way handshake 

En el protocolo tcp, se encuentra el acuerdo de 3 pasos de TCP el cual permite que dos dispositivos creen una configuración conjunta para poder permitir la conexión entre estos. 

Esta configuración se hace mediante el envio de ciertos paquetes que contienen una configuración y mediante estos pueden intercambiar la configuarción que ambos utilizaran para trnasmitir información.

En primer lugar, uno de los nodos envia un `SYN PACKET` a otro nodo remoto.

Luego el nodo remoto devuelve un `SYN-ACK PACKET` siendo este el paquete que confirma que el nodo remoto sabe que va a haber una configuarción y abre los puertos necesarios para que ambos puedan tener una vía fiable de comunicación.

Por último, el nodo emisor envía un `ACK PACKET` confirmando de que el nodo emisor sabe que existe la conexión para poder transmitir información. 

Este es, a modo simple, el cómo se establece una conexión mediante TCP, mediante esta negociación se acuerdan otras cosas como el tamaño máximo de los paquetes que se van a enviar mediante esta vía, el ancho de banda disponible para los mismos, que tantos paquetes simultaneamente se pueden enviar al mismotiempo entre otras cosas. 

## Port scanning con Nmap

`nmap` es una herramienta open source muy poderosa que nos permite realizar escaneo de puertos de una máquina.

Hay que tener claro que realizar un escaneo de puertos sin autorización del propietario de la máquina puede ser un delito por lo que se recomienda que se solicite permiso del propietario antes de realizar ningún tipo de escaneo de redes.

Se instala con apt `apt install nmap`.

Si ejecutamos `nmap [hostname/ip]` de forma predeterminada va a intentar obtener la inforamción de los puertos 0-1000. 

Con el flag `-p` podemos especificar un puerto en especifico `-p 3000`, varios puertos separados por comas `-p 3000,3030,3080` o un rango de puertos `-p 0-3000`, o si lo deseamos, podemos escanear todos los puertos con `-, o si lo deseamos, podemos escanear todos los puertos con `-p -`  


En la sección de las ip`s, podemos especificar una IP en especifico y además, podemos indicar un rango de ip`s las cuales podemos indicar que realice un escaneo. Esto lo indicamos con `nmap [ports] 172.198.0.1-100` lo que esta al lado de la ip después del guión, es las ips que va a iterar; si queremos iterar desde esa ip, por lo que la lista de ip`s anterior indica que se escanen desde la ip, 172.198.0.1 hasta la 172.198.0.101.

### Diferentes tipos de escaneo

En nmap tenemos diferentes tipos de escaneo disponibles, de manera predeterminada, nmap realiza un escaneo de tipo -sS el cual se refiere a un escaneo de `TCP-SYN-Scan`. Lo que hace es construir y enviar los paquetes a los respectivos puertos para poder ser analizados. A groso modo lo que hace es realizar el 3-way hanshake y cuando este recive el paquete `SYN-ACK` dropea la conexión.

También podemos hacer escaneo de puertos de tipo `UDP-Scan` usando la flag -sU. Es recomendable que se realicen multiples escaneos cuando se escanea mediante este protocolo, esto porque el protocolo UDP es menos fiable que TCP y este es más propenso a perder paquetes. Por lo que para evitar errores, se recomienda realizar multiples test.

## Network Address Translation (NAT)

Las direcciones NAT nos permiten solucionar un problema que tenemos relacionado con las direcciones IPV4 que es el que tenemos una cantidad limitadas de IP`s para una cantidad muy grnade de dispositivos que hay disponibles y que cada vez son más.

Una de las soluciones que tenemos para este problema es el NAT.
