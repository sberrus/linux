# Comandos útiles para manejo y administración de fs

Los siguientes comandos nos ayudaran a manejar correctamente los fs.

``` bash
# Devuelve los procesos que estan haciendo operaciones o que tienen ficheros abiertos en este fs.
lsof +D <ruta punto de montaje>
```

## Ampliar FS usando lvm
Para ampliar fs debemos hacer lo siguiente: 
- Comprobamos si el vgsystem cuenta con bloques disponibles para hacer la operación.
- Despues desmontamos el filesystem con el comando `umount <volume_path> <mountpoint>`
- Hacemos la ampliación con el comando `lvextend -L+<tamaño usando nomenclatura - consultar man>`
- Ampliamos el fs en cuestion:
    - Comprobamos el estado del volumen `e2fsck -f <volume_path>`
    - Extendemos el tamaño del fs del volumen `resize2fs <volume_path>`
Si todo sale bien, al ejecutar `df -h` se observaran los cambios realizados.

## Proceso para montar un nuevo filesystem

Forma para ver ls LVM.

Para poder montar un volumen lógico e instalar un fs dentro, debemos hacer lo siguiente:


1. Comprobar disponibilidad en disco para montar nuevos volumenes

    - `vgdisplay` -> Lista los VG Groups disponibles. En estos podemos comprobar cuanto espacio disponible tiene el volume group y a partir de estos podemos definir el tamaño del lv. Lo que debemos localizar es el dato `PE size` el cual indica el tamaño de los PE siendo estos la cantidad mínima de espacio asignable en este volume group. Es importante este dato ya que para asignar un nuevo lv tenemos que usar el valor PE Size para saber el espacio que vamos a asignar a cada lv. EJ. Tenemos un `PE Size de 4.00MiB` si queremos un lv con 1GB de almacenamiento, debemos asignarlo usando medidas GiB y que estas sean divisibles entre PE. Por lo que si queremos 1GiB para un lv, necesitamos indicar que el lv tendrá 1024MiB para que sea más optimo.


    - `lvdisplay` -> Muestra todos los volumenes montadoso

2. Crear nuevo Volumen Lógico y asignar el file system para poder acceder.
- `lvcreate -L 1G -n <nombre_nuevo_volumne_logico> <nombre_del_vg>` -> Define un nuevo volumen lógico en el VG Group.
- `mkfs.ext4 <path_volumne_logico>` -> Formateamos el volumen con el tipo de formato definido, tenemos otros comandos para poder formatear mkfs.ext{2,3,4} etc...
- `mount <volumen_logico> <ruta_absoluta_filesystem>` -> Monta en el volumen el filesystem para poder utilizarlo y ser accesible. Se debe indicar la ruta identificativa del volumen lógico y luego se indica el directorio en el cual se indica donde se alojara en el filesystem dicho directorio para poder acceder.
- `df -h <directorio>` -> listamos el filesystem del directorio en cuestión para poder visualizar en que volumen lógico se encuentra montado dicho el fs.

3. Configurar montaje a nivel de arranque de sistema. 
`vim /etc/fstab` -> Se edita el fichero `/etc/fstab` donde se encuentra las directricez para el montaje de los filesystem cuando arranca el sistema.
El fichero en cuestión contará con un formato similar al siguiente:

``` text
/dev/vgsystem/path_logical_volume filesystem_path_to_mount       ext4        defaults        1 2
|------------  1 ---------------| |---------- 2 ---------|       |-3|        |-  4 -|        5 6
```

En el ejemplo anterior, podemos observar lo siguiente; separados por espacios en blanco tenemos los siguientes campos: 

    a. ruta de volúmen lógico definida para el filesystem.

    b. ruta de punto de montaje de filesystem.

    c. formato de filesystem (ext4 suele ser el ideal para la mayoría de casos)

    d. este valor se deja 'default' para las configuraciones por defecto que son (R/W permission, escritura en cache, no usar cuotas, entre otras opciones por defecto).

    e. si se incluye en las copias de seguridad (1 - True, 0 - False)

    f. orden de chequeo de fs. Indica el orden en el que se deben chequear estos fs usando el comando `fsck`. (0 - No se comprueba, 1 - Se comprueba de primero *usualmente se usa para la ruta `/`*, 2 - Se comprueba luego *Útil para fs secundarios*)

4. opcional y extras

- `umount <punto_de_montaje>` -> Este comando desmonta un fs de un punto de montaje.

- `mount -av` -> Este compruaba el fichero `/etc/fstab` y monta los fs que no esten montados; o informa de los fs que ya se encuentren montados en el sistema.

- `systemctl daemon-reload` -> reinicia la configuración de systemctl y sus demonios propios

## Procesp para desmontar Filesystem y liberar espacio de VG

Cuando se deje de usar un fs, podriamos necesitar liberar ese espacio para poder utilizarlos para otros servicios. Para hacer esto, necesitaremos hacer lo siguiente:

1. Desmontar el filesystem
``` bash
# Descubrimos los FS que se encuentran montados
df -h .

# Desmontamos el fs (El campo "Mounted on" cuando ejecutas `df -h`)
umount /ruta/absulota/filesystem

# Desactivamos el LV. Esto con el fin de garantizar que no hay nada realizando operaciones IO en este FS.
lvchange -an /ruta/volumen/logico
lsof /ruta/punto/montaje # Ver que procesos estan haciendo operaciones IO en este fs.

# Eliminamos el LV
lvremove /ruta/volumen/logico
```