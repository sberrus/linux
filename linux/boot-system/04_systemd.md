# systemd

`systemd` es el manager del sistema operativo. Cuando arrancamos el sistema, el bootloader carga el kernel en la memoria y de inmediato ejecuta el principal programa de todo el sistema operativo, este es el `systemd`.

Este, al ser el primer programa que el SO ejecuta, este siempre va a tener el PID 1. Esto podemos comprobarlo usando el siguiente comando:

```salida comando ps 1
PID TTY      STAT   TIME COMMAND
  1 ?        Ssl    0:00 /init
``` 
Aunque aparezca como /init, esto es un symlink al binario systemd.

Este proceso es el encargado de manejar el resto de procesos en el sistema, es el que por debajo se encarga de inicializar procesos, montar dispositivos, empezar servicios, entre otras cosas.

`systemd` es bastante extenso por lo que no será posible verlo en profundidad, pero, con esto vemos que el systemd es una pieza importante para la gestión de los procesos y el arranque del sistema.

Veremos para ejemplificar unos casos básicos de manejo de procesos usando `systemd` como:

- Iniciar un proceso en el arranque que configure e inicialice un servidor web.
- Que se ejecute un comando en el momento de que arranque el sistema.
- Configurar un proceso que se ejecute sistematicamente cada X cantidad de tiempo.

## Controversia de systemd

En linux, existe una controversia respecto a systemd. Esto porque en muchas distros es el gestor predeterminado del sistema y hay personas que piensan que es más complicado de lo necesario, que la arquitectura no cuadra con la filosofia de UNIX. Entre otras cosas, se le recalca problemas de optimización y tiempos de ejecución en booteables desde el disco por como gestiona los procesos y hacen que el resto de elementos se vean afectados.

Por otra parte, las personas que estan más a favor de systemd indican que este sistema esm uy flexible y dnámico y la configuración puede cambiar en runtime.

## Estructura general de systemd

`systemd` tiene varios modos con los que podemos trabajar como son los siguientes:

- system mode: Maneja el proceso de boot e incializa los servicios requeridos en paralelo. Lee los ficheros de configuración, dibuja los gráficos de dependencias y luego ejecuta los comandos necesarios para obtener el resultado.

- user mode: Lo mismo que `system mode` pero enfocado a servicios (luego de que el usuario se haya logeado)

### bloques básicos de systemd

- Unit: 
	- Este es el bloque más básico de `systemd`, este tiene varios tipos, pero los más usados suelen ser Service, Target, Timer...
	- Los Units pueden depender de otros Units.
- Service:
	- Es un tipo especial de Unit, consta de un servicio que debe correr en el sistema.
	- Estos pueden estar en estado enabled, disabled, started, stopped, restarted, reloaded,...
	- Con estos podemos declarar que en el momento del booteo, que inicialice un servidor web, o que ejecute algún script que tengamos preparado o un proceso que deba ejecutarse pasado una cantida de tiempo X.

### Donde se declaran los servicios

Tanto los Units como los services, son declarados en ficheros que tienen una extensión que relaciona el servicio o unit con el tipo, por lo que podremos encontrar ficheros como file.unit, file.service, file.timer, ...

#### ruta /lib/systemd/system | /usr/lib/systemd/system
Estos servicios se declaran en la ruta /lib/systemd/system o /usr/lib/systemd/system para las configuraciones y rutinas propias del sistema. Esta es importante para el correcto funcionamiento del mismo. En este se almacenan las configuraciones para el mantainer del sistema. Estos ficheros de configuarción no debemos tocarlos.

#### ruta /run/systemd/system
Esta ruta contiene ficheros de configuración no persistente, por lo que al reiniciarse el sistema, estas ficheros de configuración se pierden.

Es útil para cuando tenemos una unit o proceso que debe levantar otra Unit o Servicio para que sea usado en el momento de la ejecución de dicho proceso o para procesos que sean temporales.

#### ruta /etc/systemd/system
Esta ruta contiene los ficheros de configuración del administrador (root) del sistema. Lo que se ponga en este directorio sobreescribe lo que encuentre en la ruta /(lib,usr)/systemd/system, por lo que si declaramos un fichero con el mismo nombre que algún fichero alojado en la ruta anteriormente mencionada, el sistema lo va a reescribir.

En este directorio es donde debemos alojar los ficheros de configuración personalizados que declaramos nosotros. 

### comando para ver las rutas donde se encuentran los ficheros de configuración de systemd

Para ver las rutas de los ficheros de configuración usamos el comando `systemd-analyze --system unit-paths`, con este comando podemos ver todas las rutas que tiene nuestro sistema habilitados para realizar tareas con systemd.

### Manejando Units con systemd

Depende del sistema, puedes tener instalado `systemctl` o `service`, dependiendo de que programa tengas ejecutando, los comandos serán diferentes.

Con estos comandos podemos ver los programas que estan corriendo y su respectivo status. En el caso de systemctl, la inforamción es más detallada por lo que para tareas de debugging resulta ser una mejor herramienta.


