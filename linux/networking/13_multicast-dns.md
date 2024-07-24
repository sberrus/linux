# Multicast DNS

Antes que nada debemos definir un tema importante para este punto:

## Hostname

Los hostnames son los nombres que mapeamos para poder acceder a otros dispositivos.

Será usado en la negociación DHCP. 

El hostname es directamente un dato que sirve para poder identificar una máquian dentro de una misma red.

### Accediendo al hostname del dispositivo

Directamente con el comando hostname, podemos observar el hostname que tenemos definido en nuestro sistema.

### Modificando el hostname por /etc/hosts /etc/hostname
Para ver que hostname tenemos definido en nuestra máquina, debemos ir al fichero `/etc/hostname`. Podemos también cambiar el hostname directamente modificando este fichero.

Y también, para evitar problemas con la red, debemos modificar el fichero de `/etc/hosts` para que el hostname pueda ser accedido con el nombre que hemos definido y para finalizar, se reinicia el servicio de dns para que los cambios se guarden correctamente.

## Útilidad del multicast DNS Standard

Una de las ventajas que tenemos al usar los hostnames, es que podemos acceder a los dispositivos dentro de la misma red utilizando el hostname como idnetificador, por lo que si queremos acceder a un dispositivo o hacerle ping, podemos usar el hostname como identificador, añadiendole al final la extensión `.local`; porl o que el comando `ping <hostname>.local`, si el hostname esta dentro de la red, podrá ser accedido.

El `.local` al final del hostname indica el multicast DNS Standard (mDNS) el cual es un DNS que tiene unas particularidades que lo diferencian del DNS tradicional. Esto hace que los dominios *.local sean para identificar máquinas que estan dentro de la red a la cual pertenece la máquina que lo ejecuta y este nunca llega al DNS de internet.

Al ser un multicast, lo que hace al momento de hacer la petición es realizar una petición mediante la vía multicast dentro de la red y si algún hostname coincide con el que se esta buscando, esta va a devolver la información para poder ser accedido desde esta. Por lo que para gestionar redes locales complejas ayuda bastante conocer los hostnames de las máquinas.

Para poder hacer uso de estas carcteristicas, debemos tener la configuración configurada correctamente. Para esto debemos configurar que la máquina no pueda ser accedida haciendo uso de DNS y por otro lado, configurar que podamos responder haciendo uso del mDNS. En el caso de Linux, podemos configurar la máquian instalando el daemon `avahi`.

En el caso de CentOS. La configuración es diferente.

Lo que hacen estas configuraciones es permitir que la máquina este escuchando constantemente al broadcast para poder responder las solicitudes .local que hayan en la red y responder cuando sea necesario con los datos de la máquina.
