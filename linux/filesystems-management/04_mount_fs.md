# Proceso para montar fs

Despues de haber creado un volumen, hay que montarlo para poder acceder a este mediante nuestro fs.

``` bash
# Creamos fs
mkdir {ruta}

# Montamos el fs
mount {device} {mount_point_route}

# Montaje especificando tipo de fs
mount -t ext4 {device} {mount_point_route}

# montar fs como read-only
mount -o ro ext4 {device} {mount_point_route}

# desmontar un fs
umount {mount_point_route}
```

Para ver todos los dispositivos o volumenes montados en el fs actual, hacemos uso del comando `df -h`.

## Tipos de montaje

Cuando montas un dispositivo, puedes asignar una serie de opciones que van a hacer que el fs se comporte de cierta forma.

### Opciones para ext4
- ro (read only): . Esta opción afecta a todos los usuarios inclusive el usurio root, por lo que no será posible modificar el contenido de los datos que contenga este dispositivo.
- rw (default)(read-write): Permite leer y escribir.
- noexec: No permite la ejecución de ejecutables en este fs.
- nosuid: Este deshabilita las funcionalidades de `set-user-identifier` y `set-group-identifier` en el fs montado.
  - hay que tener cuidado con este tipo de fs debido a que este va a tener los permisos del usuario que este realizando la acción, por lo que debemos tener cuidado porque si en este hay ficheros ejecutables, van a tener los permisos del usuario que esta ejecutandolo.
- noatime: No actualiza el timestamp de los ficheros cuando estos son leidos o ejecutados.

Hay más opciones disponibles que se pueden consultar con `man mount`.

