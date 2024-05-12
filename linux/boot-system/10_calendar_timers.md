# Calendar Timers

Los calenadar timers son una capacidad que tiene systemd para ejecutar servicios de manera programada especificando los días o cada cuanto tiempo se va a ejecutar dicho programa.

Pero antes que nada, para definir un timer basado en calendario, debemos ver la estructura que nuestro sistema esta usando en este momento. Esto lo hacemos con el comando `systemd-analyze timestamp now`, esto nos va a devolver la estructura de datos de fecha y hora que esta usando systemd en este momento.

``` salida del comando systemd-analyze timestamp now
  Original form: now
Normalized form: Sat 2024-05-11 14:48:46 CEST
       (in UTC): Sat 2024-05-11 12:48:46 UTC
   UNIX seconds: @1715431726.937081
       From now: 86us ago
```

Sabiendo el tiempo que usa el sistema, podemos hacer uso de los wildcards para definir ciertos valores a la hora de definir cada cuanto tiempo se va a ejecutar este unit.timer.

``` 
[Timer]
Oncalendar=*-*-* *:0,15,30,45
```

En la directriz anterior tenemos lo siguiente: sabiendo que la fecha esta en AAAA-MM-DD por cada * en cada espacio separado por `-`, indica que va a ejecutarse en todos los valores que hayan. Por lo que en la directriz anterior significa que todos los Años, de todos los Meses, de todos los Dias se va a ejecutar. 

En el caso de las horas lo mismo que en las fechas con la diferencia de que se separan por `:`. También podemos indicar valores coincidentes separados por comas, por lo que en la directriz, en la sección de horas indica que a todas las horas, a las 00,15,30,45 minutos, se va a ejecutar ese unit.timer.

Para evaluar si el tiempo es correcto podemos hacer uso del comando `systemd-analazy calendar '<wildcard>'` y vemos si el wildcard esta construido correctamente.

En este caso veremos que si el wildcard esta construido correctamente, mostrara una inforamción parecida a la siguiente:

```
  Original form: *-*-* *:0,15,30,45
Normalized form: *-*-* *:00,15,30,45:00
    Next elapse: Sat 2024-05-11 15:00:00 CEST
       (in UTC): Sat 2024-05-11 13:00:00 UTC
       From now: 1min 22s left
```

De esta forma podemos ver si el wildcards esta construido correctamente. 

Tambien existen kw como `yearly, hourly, minutly, etc.` que ya vienen con wildcards predefinidos por el sistema.

Siempre es recomendable para evitar problemas de que no se detecte correctamente el timer, hacer uso de `systemctl restart <unit.timer>`, para que el sistema reconozca correctamente los cambios que se han realizado.

## Ver lista de timers programados

Para ver todos los timers que estan programados en nuestro sistema, hacemos uso del comando `systemctl lis-timers`. De esta forma podemos ver todos los timers que estan programados en nuestro sistema.
