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