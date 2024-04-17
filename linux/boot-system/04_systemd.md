# systemd

`systemd` es el manager del sistema operativo. Cuando arrancamos el sistema, el bootloader carga el kernel en la memoria y de inmediato ejecuta el principal programa de todo el sistema operativo, este es el `systemd`.

Este, al ser el primer programa que el SO ejecuta, este siempre va a tener el PID 1. Esto podemos comprobarlo usando el siguiente comando:

```salida comando `ps 1`
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
