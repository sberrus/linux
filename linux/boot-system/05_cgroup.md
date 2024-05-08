# CGROUP
Esta es una caracteristica que nos ofrece el Kernell de Linux que nos permite asignarle recursos jerarquicamente a los procesos.

Es una forma de poder asignarle recursos finitos y que los procesos y los hijos de estos procesos, no puedna coger más recursos un mismo cgroup pueden haber multiples procesos además de otros cgroup.

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


