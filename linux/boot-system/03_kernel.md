# kernel

En esta sección vamos a ver en profundidad qué es el kernel y como este se configura.

El kernel es la pieza de software más básica en los sistemas UNIX los cuales nos permiten cargar en memoria los modulos necesarios para que el sistemas.

Esta es la pieza de software encargada de manejar los `scheduling` y los recursos, se encargad el (IPC) inter-process communication, el manejo de la memoria, alocación  y delocación de recursos en la memoria entre otras cosas. 

Además, este soporta varios `filesystems` como pueden ser ext4,XFS,Btrfs,etc; a su vez que se encarga de las tareas de lectura/escritura en los mismos.

El kernel también se encarga de manejar ciertos protocolos de red como TCP/IP, Ethernet, entre otros para poder conectarse efectivamente a la red. También, respecto a redes, maneja el routing, el filtrado de paquetes y el control de tráfico. 

A grandes rasgos, el kernel se encarga de manejar el Hardware Abstraction Layer (HAL), el cual, para que nosotros no tengamos que preocuparnos de la arquitectrua ni del diseño del sistema, el kernel hace posible que podamos comunicarnos fácilmente con los distintos componentes de hardware de nuestro sistema.

## /boot folder

En este directorio, encontramos las versiones del kernel que el sistema va a montar en memoria al momento de hacer el boot. En este podemos encontrar tanto el kernel del sistema como versiones anteriores para tareas de depuramiento y debugging.

## Kernel Modules

Los modulos de kernel son piezas de software que el kernel es capaz de cargar en memoria bajo demanda, estos son softwares que son manejados por empresas colaboradoras con el sistema. Estos pueden ser por ejemplo:

- Drivers de dispositivos.
	- Nvidia drivers.
	- Broadcom Wireless Drivers.
	- Algunos chips especializados.
- VFIO:
	- Virtual Function I/O -> virtualizar ejecución remota de I/O.
	- Acceder desde otro dispositivo a la GPU de la máquina anfitriona.
- Otros:
	- Addons de VirtualBox para realiar virtualizaciones del sistema.

Con el comando `lsmod` podemos listar todos los modulos externos que tenemos cargados en nuestro sistema.

Siempre que se vaya a modificar aspectos del kernel como pueden ser los modulos, hay que tener claro que estos modulos pueden entrar en conflicto con el sistema, por lo que para realizar cambios en el kernel, hay que tener claro que se va a hacer y tener tiempo disponible para resolver cualquier inconveniente que se pueda presentar.

## Consideraciones

Una de las cosas que podemos hacer es, si no queremos que la actualización del kernel rompa el sistema o que entre en conflicto con otros modulos que dependan de la versión en especifico que estamos usando, podemos usar el comando `apt-mark hold <version_de_kernel>` de esta forma evitamos que a la hora de hacer un `apt upgrade`, este reviente los otros modulos.

## Como nos comunicamos con el hardware (User space, Kernel space)
