# Domain Name System DNS

Es un sistema que permite traducir nombres de dominio en IP's ayudando a la legibilidad de los sitios web.

## Proceso de obtención de dominio por DNS

1. Primero se revisa en la cache del navegador si el dominio existe, en el caso de que no exista, se pide al sistema operativo que busque en la cache del sistema operativo ya que todos los navegadores almacenan cuando resuelven la ip la información en el sistema. En el caso de que no se encuentre en el sistema operativo, se procede al paso 2.

2. Proceso DNS:

- Se solicita el dominio a un DNS Resolver. Los resolvers son servidores que nos ayudan a obtener las direcciones IP desde una capa más cercana. Por lo general estos servidores son gestionados por el ISP, estos cachean los dominios ip. En el caso de que el DNS Resolver no consiga la dirección cacheada, debe resolverla.

- DNS Resolving: Para esto el Resolver accede aleatoriamente a uno de los 13 servidores de dominios raiz aleatoriamente, que suelen estar identificados con una letra al principio entre A-M del siguiente dominio   <a-m>.root-servers.net. 

- Estos servidores lo que hacen es enlazar las peticiones de los resolvers y dependiendo de la extensión de dominio, devuelven otro servidor que se encarga de almacenar los dominios con su respectiva extensión. Por lo que todos los .com estaran en un sitio, los .net igual y asi... Luego estos servidores devuelven otro servidor ns1.* los cuales tienen almacenada la ip registrada con el nombre de dominio.

- Ya sabiendo la NS1.*, este es el que nos devuelve finalmente la información relacionada con el dominio al cual estamos intentando acceder.

Cuando obtenemos toda esa información, el resto de sistemas se actualizan con la nueva información y ya la busqueda es más rápida en un futuro y el resto de componentes DNS (glt, root-servers, cache de ISP y de sistema operativo).

La información que devuelve el NS1 es los DNS records que son los siguientes más comunes:

A: Este registro mapea un dominio con una dirección IP.
AAAA: mapea un dominio con una dirección IPV6.
CNAME: provee un alias para otro nombre de dominio.
MX: especifica un servidor de correos para el dominio.
NS: lista de servidores de nombres autoritativos para el dominio.

Esta información podemos capturarla con el comando `host <dominio>`

## Ver los saltos de forma manual con el comando `dig`

Con el comando `dig @<servidor_dominios> <NS|A|AAAA|MX|any>` podemos ir a ese salto para ver que nos devuelve el servidor de dominios y poder ver visualmente y paso a paso todos los datos que este devuelve. Es una forma manual de realizar la `resolución` de dominios.

No solo sirve para ver los records de los domain-servers sino que podemos ver los records de cualquier dominio y así podemos inspeccionar la ip de los mismos.

Veremos una salida como la siguiente:

```
; <<>> DiG 9.18.18-0ubuntu0.22.04.2-Ubuntu <<>> samdev.es any
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 46544
;; flags: qr rd ra; QUERY: 1, ANSWER: 3, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1220
;; QUESTION SECTION:
;samdev.es.                     IN      ANY

;; ANSWER SECTION:
samdev.es.              3134    IN      MX      10 mx00.ionos.es.
samdev.es.              3134    IN      MX      10 mx01.ionos.es.
samdev.es.              3134    IN      A       194.164.174.202

;; Query time: 30 msec
;; SERVER: 10.255.255.254#53(10.255.255.254) (TCP)
;; WHEN: Wed Jun 26 19:58:26 CEST 2024
;; MSG SIZE  rcvd: 102
```

De esta forma podemos observar los registros DNS de un dominio y podemos pasarle como tercer argumento el tipo de dominio que quieres observar. 

Para resolver la ip de un dominio en particular, debemos hacer lo siguiente:

1. Consultar la lista de name servers de el root `dig @a.root-servers.net com NS`

En este veremos una salida como la siguiente, la cual indica todos los servidores de la a-n los cuales contienen todos los registos com. *podemos hacer lo mismo con los .es .mx .gob etc...*

```
;; ANSWER SECTION:
com.                    25688   IN      NS      a.gtld-servers.net.
com.                    25688   IN      NS      i.gtld-servers.net.
com.                    25688   IN      NS      h.gtld-servers.net.
com.                    25688   IN      NS      j.gtld-servers.net.
com.                    25688   IN      NS      g.gtld-servers.net.
com.                    25688   IN      NS      m.gtld-servers.net.
com.                    25688   IN      NS      d.gtld-servers.net.
com.                    25688   IN      NS      l.gtld-servers.net.
com.                    25688   IN      NS      e.gtld-servers.net.
com.                    25688   IN      NS      b.gtld-servers.net.
com.                    25688   IN      NS      f.gtld-servers.net.
com.                    25688   IN      NS      c.gtld-servers.net.
com.                    25688   IN      NS      k.gtld-servers.net.
```

2. Cogemos uno al azar y pasamos el comando dig cambiando el servidor y poniendo como segundo argumento el dominio que queremos consultar, por ejemplo: `dig @a.gtld-servers.net samdev.com NS` con la siguiente salida:

```
;; ANSWER SECTION:
samdev.com.             3600    IN      NS      ns13.domaincontrol.com.
samdev.com.             3600    IN      NS      ns14.domaincontrol.com.
```

3. Cogemos el NS con la extensión que queremos consultar, y luego en la salida buscamos el registro A, `dig @ns13.domaincontrol.com samdev.es any` -> en este caso podemos usar any para ver todos los registros que necesitemos, pero si queremos buscar uno en particular simplemente filtras pasandolo como argumento.

Ya con el registro A veremos todos los registros DNS de ese dominio y donde se encuentra alojado.

## Vulnerabilidades de los registros DNS

Primero hay que tener en cuenta que los registros DNS se inventaron en un momento donde internet era significcativamente más pequeño y las personas que accedian a él eran más confiables. Con el pasar del tiempo, esto se ha vuelto una debilidad y hay gente con malas intensiones que ha encontrado formas de vulnerarlo y estos son algunos de los métodos que suelen usarse:

- DNS spoofing: Esta es una forma de ataque la cual consiste en la alteración de los registros DNS para que un dominio redirija el tráfico a un lugar no deseado. Esto es más usado por IS o por gobiernos para evitar qeu las personas accedan a ciertos lugares en la red o por Empresas de servicios de internet que puedan incluir de forma maliciosa cambios en los registros para hacer cosas malas.

- Cache poisoning: Un posible atacante altera los registros locales de DNS para redirigir el tráfico.

- Man-in-the-middle attacks: Un atacante intercepta un paquete DNS y devuelve un registro frudulento para que se registre con una ip que vaya a un sitio malicioso. Esto es más peligroso en conexiones no seguras ue no se encuentren encriptadas.

La mayoria de los casos anteriores se pueden resolver usando protocolos seguros como https para la consulta de información.
