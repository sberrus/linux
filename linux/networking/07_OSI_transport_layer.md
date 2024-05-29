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
