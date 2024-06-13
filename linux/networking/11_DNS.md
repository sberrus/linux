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
