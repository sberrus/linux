# Firewall

En esta sección veremos como se configura el firewall de manera profesional y como podemos gestionar todo el tráfico externo que entra a nuestro servidor.

Veremos en profundidad la herramienta firewalld el cual nos ayuda a gestionar el firewall de nuestro sistema. 

Estas clases van a ser básicas, por lo que para configuraciones que vayan para producción, se recomienda que se estudie más en profundidad al respecto.

**IMPORTANTE TENER CUIDADO A LA HORA DE HACER CAMBIOS EN EL FIREWALL DEBIDO A QUE SI HACEMOS CAMBIOS DE FORMA ERRONEA, PODEMOS CERRAR LA CONEXIÓN MEDIANTE SSH QUE TENGAMOS CON LA CONSOLA HACIENDO QUE ESTA QUEDE INACCESIBLE Y PODEMOS TENER PROBLEMAS PARA PODER TRABAJAR Y RECUPERAR LUEGO EL SISTEMA.**

## Cual es el objetivo de los firewalls

Antes que nada vamos a desmitificar algunas cosas de los firewalls.

- Los firewalls nos permiten definir reglas para la red y como esta puede interactuar con nosotros. 

- Por lo general, definimos reglas principalmente para el tráfico entrante. 

- Exceptuando algunos casos, la mayoria de aplicaciones no permiten el tráfico entrante y no responden de  ninguna forma a estos.

- Por otro lado, por lo general la NAT ya nos esta protegiendo del tráfico externo bloqueando todas las conexiones que se hagan directamente a las ips locales. Para que un dispositivo pueda ser accedido desde fuera de la red, debemos configurarlo correctamente para que este pueda comunicarse correctamente.

- Por lo general tampoco es buena idea bloquear todo el tráfico de la red debido a que ciertos programas que necesitan estar constantemente comunicandose con le dispositivo, al no tener respuesta de estos, el programa en cuestión cierra la conexión y podemos, dependiendo del caso estar haciendo que un programa no funcione correctamente.

## Cuales son las ventajas de tener un firewall

Las principales ventajas de los firewalls son las de analizar y filtrar los paquetes que intentan acceder a nuestra máquina para luego decidir que hacer con estos como, bloquearlos, permitir el acceso o redirigirlos a otra interfaz de red que tengamos definida. Así que dependiendo el caso, podemos permitir, bloquear o redirigir todo el tráfico siguiendo las reglas que definamos. 

Siempre se recomienda cerrar todos los puertos que no sean necesarios para evitar posibles ataques que deriven de puertos abiertos. 

Una de las formas que tenemos para monitorizar los puertos que tenemos abiertos en nuestro sistema es haciendo uso del comando `ss -4nap`. Con este comando veremos información de las conexiones que tenemos en ese momento indicando el protocolo, la ip local y el puerto que se esta usando y la ip con la cual estamos conectandonos. Por otro lado, si queremos ver las conexiones usando el protocolo IPV6, debemos usar `ss -6nap`.

Hay algo que se debe tener en cuenta y es que __siempre van a haber puertos abiertos en el sistema__, asi tnegamos definidos todos los puertos cerrados.

## ¿Porqué se recomienda usar firewalld en vez de iptables?

Iptables nos permite cambiar la configuración del subsystem de red del kernel. El problema que tiene esto es que primero, esta próximo a estar deprecado debido a que hay herramientas más modernas que nos permiten manejar mejor el tráfico que entra a nuestra máquina. Tanto es así, que en RHEL y CentOS ya estan deprecadas dichas caracteristicas.

En resumida, iptables va a ser deprecado tarde o temprano, por lo que se recomienda empezar a migrar todo a firewalld.


