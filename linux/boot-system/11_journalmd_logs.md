# Logs with systemd-journal

systemd-journal es un comando que nos permite ver un apartado de logs que devuelven los servicios a la hora de ejecutarse.

Es parte de el paquete de herramientas de systemd, pero no es una libreria de la cual systemd dependa.

Esta se encarga de gestionar los logs de los distintos units del sistema y muestra informacióm ikmportante cuando estos fallan para realizar tareas de debuggeo. Es un reemplazo del antiguo syslog.

Una de las caracteristicas principales de systemd-journald es la optimización que este tiene a la hora de almacenar los logs ya que utiliza un tipo de logeo que permite un uso más eficiente del espacio en disco de los logs.

La idea es tener un punto centralizado de logs el cual pueda ser más accesible en el ambito de los units. En el caso de que un servicio genere por si solos logs por ejemplo los logs de una bbdd o los logs de un servidor web, estos deben ir almacenados en otro sitio.

Otro punto interesante que tiene es la forma eficiente que tiene el sistema internamente para detectar que logs son importantes y cuales otros deben ser rotados para mejorar la eficiencia de la obtención de datos y el almacenamiento de los mismos. 

Por otra parte, al ser un tipo de logs especial, tiene internamente un sistema de indexado y un sistema de consultas el cual mejora las capacidades de obtención del a información consultada.

Otra de las capacidades que tenemos con este sistema es el de poder acceder a los logs que genera el kernel a la hora de realizar el boot del sistema. 

En este podemos consultar un buffer especial que se almacena siempre que se hace boot del sistema y podemos consultarlo.

## Uso de systemd-journald

El primer comando es `journalctl`, con este comando podemos consultar los logs del sistema en general desde que ha empezado a recopilar información, junto a esto, podemos pasarle ciertos flags que nos permiten consultar logs importante el sistema como los siguientes:
- -b: este flag nos permite consultar la información del último booteo del sistema. Si le pasamos el id de la posición del booteo que sale del comando `journalctl --list-boots`, si le pasamos el id de la posición del booteo. También podemos pasarle el hash identificador dle booteo.
- --list-boots: Con este flag podemos ver una lista de los booteos que ha tenido el sistema.
- -u <unit.\*>: Con esta flag podemos ver los logs de un unit en particular.
	- --since 'AAAA-MM-DD': Permite filtrar desde cuando queremos ver los logs de este servicio.
	- --until 'AAAA-MM-DD': Permite filtrar por fecha hasta cual fecha deseamos filtrar.
Junto a las flags --since y --until, podemos hacer queries para filtrar ciertas fechas en especifico.
- -r: Muestra los logs de más recientes a más antiguos.
- -f: Muestra los logs y les aplica un `follow` por lo que cada vez que haya un cambio en esos logs, se va a reflejar dicho cambio.

Como curiosidad, podemos enviar logs de manualmente a journalctl mediante el comando `systemd-cat` el cual imprime en estos logs un mensaje manualmente. Al enviar un mensaje se identifica como `unknown`, si queremos identificar el emisor de dicho log, hacemos uso del flag `systemd-cat -t <identificador>`, el identificador es útil debido a que mediante este, podemos filtrar los logs también por dicho identificador mediante `journalctl -f -t <identificador>`.
