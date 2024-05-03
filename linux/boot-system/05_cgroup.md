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

## Targets

Los targets son una forma de unir los `units` para que cumplan un objetivo. Por ejemplo: Podemos indicar y sistematizar el booteo para que ejecute una serie de programas o scripts al momento en el que se arranque un sistema.

Estos targets los definimos en un unit `.target`.

Para ver el target predeterminado del sistema, podemos usar el comando `systemctl get-status` siendo este el `target` principal del sistema. Este nos va a devolver el unit principal del sistema.

Usando el comando `systemctl cat <unit>`, podemos ver el unit y su detalle.

Para ver todos los targets podemus usar el comando `sudo systemctl list-units --type target --all`. De esta forma podremos ver el estado de todos los targets de nuestro sistema.

En resumida, los targets, son una forma de agrupar varios units y orquestar sistematicamente el arranque de ciertos units.

En ciertas distribuciones de linux tendremos targets como `graphical.target` teniendo esta todas las configuraciones necesarias para la ejecución del GNU al momento del arranque del sistema; por otra parte tendremos multi-user.target, siendo esta la configuarción predeterminada para el sistema en modo consola tty, sin cargar el GNU en el momento del arranque.

Para definir un target predeterminado del sistema usamos el comando `sudo systemctl set-default <target>`.

Para ejecutar un target, podemos usar el comando `sudo systemctl isolate <target>`

## programar units para que se ejecuten al arrancar la máquina

Para configurar un unit que se inicialice al momento de arrancar la máquina debemos indicarlo mediante el comando `systemctl enable --now <service>`, de esta forma, al arrancar el sistema, el servicio se ejecutará automáticamente.

Con la ejecución de este comando, lo que hará el sistema es leer el <service> y lo define para que se ejecute al momento en el que arranca el sistema.

En el caso de que queramos que un programa que arranca de forma predeterminada con el sistema, ya no lo haga; lo indicamos con el comando `systemctl disable <service>`. 

Y para parar cualquier programa definido en systemctl como un .service, hacemos uso del comando `systemctl disable <service>` 

Lo que hace el comando es crear un symlink y lo añade al directorio especial `/etc/systemd/system/multiuser.target.wants` En este directorio se encuentran symlinks de los distintos .targets .mounts .units etc... que se ejecutan al momento de que se ejecuta el target multi-user.target siendo este el unit principal que ejecuta el sistema. 

## Formato de un fichero unit

Los ficheros unit tienen distintas secciones los cuales podemos desglozar de la siguiente manera:

``` sección Unit
[Unit] -> En la primera fila definimos el siguiente bloque el cual indicaque es un Unit.
