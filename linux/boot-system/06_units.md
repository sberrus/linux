# Units
Para crear un `unit` personalizado, debemos crear un fichero `.unit` el cual va a contener las directrices generales de ese unit.

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

## programar units para que se ejecuten al arrancar la máquina

Para configurar un unit que se inicialice al momento de arrancar la máquina debemos indicarlo mediante el comando `systemctl enable --now <service>`, de esta forma, al arrancar el sistema, el servicio se ejecutará automáticamente.

Con la ejecución de este comando, lo que hará el sistema es leer el <service> y lo define para que se ejecute al momento en el que arranca el sistema.

En el caso de que queramos que un programa que arranca de forma predeterminada con el sistema, ya no lo haga; lo indicamos con el comando `systemctl disable <service>`. 

Y para parar cualquier programa definido en systemctl como un .service, hacemos uso del comando `systemctl disable <service>` 

Lo que hace el comando es crear un symlink y lo añade al directorio especial `/etc/systemd/system/multiuser.target.wants` En este directorio se encuentran symlinks de los distintos .targets .mounts .units etc... que se ejecutan al momento de que se ejecuta el target multi-user.target siendo este el unit principal que ejecuta el sistema. 

## Formato de un fichero unit

Los ficheros de control tienen difernetes secciones las cuales estan agrupadas luego del nombre de la sección de la siguiente forma -> [sección]; dentro de estas tienen distintos campos y directricez que demarcaran el comportamiento del unit en cuestión. Dicho esto, podemos encontrar las siguientes secciones:

[Unit]: Este define la configuración general del unit.
- Description: Añade una breve descripción de que es lo que hace el unit.
- Documentation: Enlaces para documentación relevante para el unit.
- Requires: Lista de units que deben estar activados antes de que el unit inicialice. Si alguno de estos units requeridos falla, el unit objetivo va a fallar también.
- Wants: Es parecido a Requires, pero con la diferencia es que en el caso de que alguno de los units especificados aquí falla, el unit objetivo puede continuar con la ejecución sin problema, es útil para ucando tienes units opcionales.
- After: Indica que el unit objetivo debe empezar después de que hayan inicializado los units especificados aquí. Ayuda a definir el orden en el cual los units ejecutan.
- Before: Indica que el unit objetivo debe ser ejecutado antes que los units especificados en esta sección.
- Conflicts: Indica los units con los que en el caso de que esten activos al momento de iniciar el unit objetivo, los desactiva para que no entren en conflict- Conflicts: Indica los units con los que en el caso de que esten activos al momento de iniciar el unit objetivo, los desactiva para que no entren en conflicto.
- AllowIsolate: Esta directriz en principio lo que permite es que esta unit pueda ejecutar de forma aislada, siendo este y los units que considere necesarios para poder funcionar los únicos que esten ejecutando al momento de ejecutar el comando `systemctl isolate <target>`.
[Service]: En este definimos como y cuando el servicio es inicializado, cuando se debe parar.
- Type: define el tipo de proceso y el comportamiento de inicialización. Dentro de este campo podemos asignar unos valores predefinidos que realizan lo siguiente:
	- simple: este valor indica que se comporte de la manera habitual, cuando este unit se ejecuta se mantiene activo en al terminal hasta que este finalice. Este es el valor por defecto de de los units.
	- forking: Este valor indica al servicio que se debe ejecutar en segundo plano. Esto es útil para cuando necesitamos que un servicio se ejecute en segundo plano mientras que el proceso principal continua con la ejecución. Es una forma de bifurcar de manera que un mismo servicio pueda realizar tareas en paralelo.
	- oneshot: Esto indica al servicio que debe ejecutarse solo una vez.
- ExecStart: Este es el comando que se va a ejecutar, este campo admite argumentos y opciones. Debes declarar todo explicitamente debido a que en este campo no puedes usar expansiones, ni redirecciones, ni pipes.
- ExecStop: Este es el comando que necesitamos para parar el servicio. Este campo es opcional, de forma predeterminada, el kernel envia la señal correspondiente para matar el proceso y sus hijos y listo; pero si necesitamos un comportamiento más sofisticado, podemos hacer uso de este campo para definir un script que tenga dicho comportamiento de stop del servicio.
- Restart: En este campo podemos indicar valores que dependiendo de cierto comportamiento del serivicio, este puede reiniciarse. Podemos indicarle los siguientes:
	- on-success: Si todo sale ok.
	- on-failure: Si falla.
Hay más valores que podemos indicarle como on-abnormal, on-abort, always, etc. Cada uno de estos va a depender o del retcode del proceso o de la señal enviada al mismo para disparar el reinicio.
- User: Especifica el usuario el cual va a ser el que ejecuta el servicio. Si definimos este campo, definimos con cual va a ser el usuario propietario de dicho servicio.
- Environment: Definimos variables de entorno que usualmente van a ser usadas por el servicio.

[Install]: Este define como el servicio debe ser instalado.
- WantedBy: indica los units los cuales deben incluir este unit como dependencia. Los mas comunes suelen ser multi-user.target y graphical.target. Por lo que, al ser estos dos targets uno de los primeros que carga el sistema a la hora de inicializarse, este va a ejecutarse al inciar el sistema.
Cuando se ejecuta el comando `systemctl enable <service>` lo que hace es añadir multi-user.target en el WantedBy: para que este se ejecute al incializarse el sistema.

## Como editar un unit (Legacy)
En el caso de que queramos modificar un unit que ya haya sido creado con anterioridad, debemos hacer lo siguiente:

Los units se crean por defecto en la ruta `/lib/systemd/system/`, lo que debemos hacer acontinuación es copiar ese fichero en la ruta `/etc/systemd/system`; en esta ruta, systemd por defecto va a priorizar lo que este en la ruta `etc/*` antes que `/lib/*`. Luego, cuando ya hayamos modificado el unit que necesitemos modificar, debemos actualizar systemd para que detecte que hemos realizado esos cambios con el comando `systemctl daemon-reload`. De esta forma recargamos la configuración de los units y se reemplaza el unit original con el personalizado que hemos creado.

En el caso de que sea un servicio que este `enable`, se recomienda para el servicio luego del `systemctl daemon-reload` y luego volverlo a levantar para que actualize correctamente la configuración con el nuevo unit.


## Como editar un unit (nuevo método) entre otros métodos
La forma más moderna de cambiar la configuración de un unit sin modificar el fichero original es haciendo uso del comando `systemctl edit <service>` Este comando lo que hace es crear un fichero nuevo en `/etc/systemd/system/<service>.d` el cual va a ser el nuevo fichero de configuración del servicio. De esta forma tenemos un método más comodo para realizar estos cambios.

Este comando genera un fichero nuevo el cual va a tener toda la configuración anterior del unit comentada y nosotros vamos a poder sobreescribir este fichero con la nueva configuración que necesitemos. Internamente systemctl va a coger la configuración original y va a añadir lo que nosotros añadamos en ese fichero al final del mismo, cuando se vaya a cargar la configuración, va a leer el original más lo que hayamos añadido en el fichero anterior.

Puede ocurrir que en el caso de que queramos sobreescribir una configuración que ya exista en la configuración anterior como ocurre en el caso de `WantedBy`, podemos ver que al momento de cargar el enable de nuevo, se crean 2 symlinks en este. Para evitar este error, si queremos editar un campo que ya había sido definido en el fichero anterior, debemos primero pasar el campo con el valor vacío y luego pasar de nuevo el campo con el valor que queremos utilizar. De esta forma, estamos indicando a systemd que no queremos que utilize la configuración anterior, solo la nueva.
