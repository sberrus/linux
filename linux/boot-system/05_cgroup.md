# CGROUP
Esta es una caracteristica que nos ofrece el Kernell de Linux que nos permite asignarle recursos jerarquicamente a los procesos.

Es una forma de poder asignarle recursos finitos y que los procesos y los hijos de estos procesos, no puedna coger más recursos.

En un mismo cgroup pueden haber multiples procesos además de otros cgroup.

Entre las cosas que podemos hacer con cgroup serían:

- Definir el consumo máximo de memoria de un grupo.
- Definir el consumo máximo de CPU de un grupo.
- Medir el consumo de los recursos de un grupo.
- Congelar todos los procesos de un grupo.

Estas capacidades que nos ofrece cgroup son realmente útiles sobretodo en los casos en los que tenemos aplicaciones desplegadas en contenedores y queremos limitar el consumo de los mismos para que no canibalicen recursos a otros contenedores o procesos.

Para ver todos los cgroups ocupamos el comando `systemctl status`. Con este comando podemos ver en el campo CGroup de forma jerarquica, todos los Cgroups que existen en el sistema.

Al ejecutar el comando, veremos una salida similar a la siguiente:

``` salida comando systmectl en la sección CGroups:
   CGroup: /                                                                                                                       ├─user.slice                                                                                                            │ └─user-1000.slice                                                                                                     │   ├─user@1000.service                                                                                                 │   │ ├─session.slice                                                                                                   │   │ │ ├─pipewire-media-session.service                                                                                │   │ │ │ └─697 /usr/bin/pipewire-media-session                                                                         │   │ │ └─pipewire.service                                                                                              │   │ │   └─696 /usr/bin/pipewire                                                                                       │   │ ├─app.slice                                                                                                       │   │ │ └─dbus.service                                                                                                  │   │ │   └─711 /usr/bin/dbus-daemon --session --address=systemd: --nofork --nopidfile --systemd-activation >           │   │ └─init.scope
           │   │   ├─688 /lib/systemd/systemd --user
           │   │   └─689 (sd-pam)
           │   └─session-1.scope
           │     ├─631 /bin/login -f
           │     └─698 -bash
           ├─init.scope
           │ └─1 /sbin/init
....................................
```

En la siguiente salida podemos ver que los CGroups los va listando en formato de arbol. Por lo que el CGroup principal es "/", de este parten el resto de CGroups como `user.slice`, que a su vez, tiene dentro otro CGroup `user-1000.slice` que dentro puede tener otros CGroups, etc. Esto hasta que logramos observar listados procesos los cuales van a empezar por un número, siendo este su PID; luego de la ruta del comando que se esta ejecutando como en `697 /usr/bin/pipewire-media-session`. 

## Monitorizar los recurso de los CGroups

Para poder ver los recursos que los CGroups estan consumiendo en nuestro sistema, podemos hacer uso del comando `systemd-cgtop`, con este comando, similar a como podemos hacer con `htop` para ver el consumo de los procesos en nuestro sistema, con `systemd-cgtop`, podemos ver el consumo que tienen los CGroups. 

## Creando CGroups personalizados

Para crear CGroups personalizados, debemos crear un fichero `.unit` el cual va a contener las directrices generales de ese unit.

Para añadir un `unit` personalizado debemos crear un fichero en la ruta `~/.config/systemd/user`, esta ruta especial permite crear units para un usuario en especifico que se va a ejecutar solo para este.

Crearemos un fichero en la ruta indicada anteriormente con un identificador propio y finalizado en `.slice`.

En el caso del curso van a limitar el consumo de un proceso por el espacio de memoria que este pueda ocupar, para nuestro caso particular, al estar en un WSL, voy a limitar el consumo de la cpu del proceso mediante los siguientes directricez:

``` directricez para unit personalizado
[Slice]
CPUShares=256
```

Para ejecutar un proceso con una configuración de un slice, hacemos uso del siguiente comando `systemd-run --user --slice=<nombre_slice> <ruta_proceso>`

Al ejecutar el comando veremos una salida como la siguiente:

``` salida de comando 
Running as unit: run-r79134d5eb0ee4832b83e10204f8f51df.service
```

Cuando vemos esta salida, ya esta configurado el unit, ahora al ejecutar el proceso, veremos que va a tener los recursos limitados.

Habría que buscar más en detalle debido a que no me funciona. lol

Hay veces que en ciertos sistemas hay procesos que no son la raíz que usa systemctl para asignar recursos con los units, para saber cuales son los procesos que debemos indicar en el unit, debemos buscar la ruta que nos muestra `ps -ef` y buscar el procesos que realmente es el que se esta ejecutando. 

En el caso de firefox en ubuntu, wl comando `which firefox` devuelve una ruta difernete a la que aparece en `ps -ef`. 

## targets ...completar...

Los targets son una forma que tenemos de orquestar varios units para que podamos agrupar directrices para un grupo de units que compartan configuración. 

Podemos definir cuando se ejecutan y cual de los targets es el principal o predeterminado del sistema.


