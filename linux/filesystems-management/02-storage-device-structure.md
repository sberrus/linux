## Alineación y sectores de disco (Advanced Format)

Los discos modernos (especialmente HDD y SSD) ya no trabajan únicamente con sectores de 512 bytes:

*   **Sectores lógicos**: lo que el SO ve (512B o 4096B).
*   **Sectores físicos**: tamaño real interno del disco (normalmente 4096B).

Esto se conoce como **Advanced Format (4Kn / 512e)**.  
Una mala alineación de particiones provoca:

*   Más operaciones I/O
*   Peor rendimiento
*   Mayor desgaste en SSD

Por eso hoy en día las herramientas modernas (`parted`, `gparted`, `fdisk` nuevos) alinean automáticamente las particiones a múltiplos de 1 MiB.

***

## Tipos de dispositivos de almacenamiento

### HDD (Hard Disk Drive)

*   Basados en discos magnéticos rotatorios.
*   Mayor latencia por partes mecánicas.
*   Mejor coste por GB.
*   Más propensos a fallos físicos.

### SSD (Solid State Drive)

*   Memoria flash NAND.
*   Muchísima menor latencia.
*   Sin partes móviles.
*   Vida útil limitada por ciclos de escritura (TBW).

Es importante que los filesystems y el SO estén optimizados para SSD (TRIM, discard, etc.).

***

## TRIM y Garbage Collection (SSD)

En SSD, borrar un fichero **no libera físicamente los bloques** de forma inmediata.

*   **TRIM**: el SO le indica al SSD qué bloques ya no contienen datos válidos.
*   **Garbage Collection**: el controlador del SSD reorganiza internamente los bloques para optimizar escrituras futuras.

Filesystems como `ext4`, `xfs`, `btrfs` y `zfs` tienen soporte para TRIM.

***

## Journaling vs Copy-on-Write

### Filesystems con Journaling

Ejemplos: `ext3`, `ext4`, `xfs`

*   Guardan un registro (journal) de operaciones antes de ejecutarlas.
*   Permiten recuperación rápida tras apagados inesperados.
*   No protegen completamente contra corrupción silenciosa de datos.

### Filesystems Copy-on-Write (CoW)

Ejemplos: `btrfs`, `zfs`

*   Nunca sobrescriben datos directamente.
*   Al modificar un bloque, se escribe uno nuevo y luego se actualizan punteros.
*   Permiten snapshots consistentes y recuperación avanzada.

***

## ZFS (Zettabyte File System)

ZFS merece una sección propia por su diseño:

### Características clave

*   **Filesystem + gestor de volúmenes** (no necesita LVM, RAID por separado).
*   **Copy-on-Write**.
*   **Checksums en todos los datos y metadata**.
*   **Autocorrección de datos** (si hay redundancia).
*   **Snapshots y clones nativos**.
*   **Compresión y deduplicación** integradas.
*   **Soporte avanzado de RAID (RAID-Z)**.

### Integridad de datos

ZFS detecta corrupción silenciosa (bit rot):

*   Cada bloque tiene un checksum.
*   Al leer datos, verifica integridad.
*   Si hay redundancia, repara automáticamente.

### Pools y datasets

*   **zpool**: conjunto de discos físicos.
*   **datasets**: filesystems lógicos dentro del pool con propiedades independientes (compresión, cuotas, snapshots).

### Casos de uso ideales

*   Servidores
*   Sistemas de backup
*   Almacenamiento crítico
*   NAS (TrueNAS, Proxmox)

⚠️ Requiere más memoria RAM (tradicionalmente se recomienda >8 GB).

***

## RAID: concepto general

RAID (Redundant Array of Independent Disks) permite:

*   **Rendimiento**
*   **Redundancia**
*   **Disponibilidad**

### Tipos comunes

*   **RAID 0**: rendimiento, sin redundancia.
*   **RAID 1**: espejo.
*   **RAID 5**: paridad distribuida (mínimo 3 discos).
*   **RAID 6**: doble paridad.
*   **RAID 10**: espejo + striping.

Filesystems como `btrfs` y `zfs` implementan RAID a nivel de filesystem.

***

## Metadata y atributos extendidos

Los filesystems modernos manejan:

*   **Permisos POSIX**
*   **ACLs (Access Control Lists)**
*   **Extended Attributes (xattr)**

Esto permite:

*   Seguridad avanzada
*   Integración con SELinux, AppArmor
*   Metadata adicional sin afectar el contenido del fichero

***

## Montaje y puntos de montaje

Un filesystem debe montarse para ser accesible:

*   Se monta en un **mount point** (directorio vacío).
*   El archivo `/etc/fstab` define montajes persistentes.
*   Opciones de montaje afectan rendimiento y seguridad (`noexec`, `nodev`, `nosuid`, `discard`, etc.).

***

## Resumen de cuándo usar cada filesystem

*   **ext4**: uso general, estable, simple.
*   **xfs**: grandes volúmenes y alto I/O.
*   **btrfs**: snapshots sencillos, entornos dinámicos.
*   **zfs**: máxima integridad y control.
*   **exFAT**: compatibilidad entre sistemas.
*   **NTFS**: interoperabilidad con Windows.

***
