# Guía Resumida del Filesystem de Linux

| Directorio      | Función Principal                                                                 |
|------------------|-----------------------------------------------------------------------------------|
| `/`              | Raíz del sistema. Punto de inicio de todo el árbol de directorios.                |
| `/bin`           | Binarios esenciales (comandos básicos como `ls`, `cp`, `mv`, `bash`).             |
| `/boot`          | Archivos de arranque: kernel, `initrd`, `grub`.                                   |
| `/dev`           | Archivos de dispositivos (discos, puertos, terminales).                           |
| `/etc`           | Archivos de configuración del sistema y servicios.                                |
| `/home`          | Directorios personales de los usuarios.                                           |
| `/lib`           | Bibliotecas compartidas necesarias por los binarios en `/bin` y `/sbin`.          |
| `/media`         | Punto de montaje automático para dispositivos externos (USB, CD).                 |
| `/mnt`           | Punto de montaje temporal (manual) para sistemas de archivos.                     |
| `/opt`           | Software opcional de terceros o aplicaciones adicionales.                         |
| `/proc`          | Sistema de archivos virtual que representa procesos y kernel en tiempo real.      |
| `/root`          | Directorio personal del usuario root (administrador).                             |
| `/run`           | Datos temporales de estado en tiempo de ejecución (PID, sockets, etc.).           |
| `/sbin`          | Binarios esenciales para administración del sistema (solo root).                  |
| `/srv`           | Datos específicos para servicios (como FTP, HTTP, etc.).                          |
| `/sys`           | Sistema de archivos virtual para exponer información del hardware y kernel.       |
| `/tmp`           | Archivos temporales. Puede limpiarse al reiniciar.                                |
| `/usr`           | Aplicaciones y archivos de solo lectura del usuario (no esenciales).              |
| `/usr/bin`       | Binarios de usuario no esenciales (ej. `vim`, `python`).                          |
| `/usr/sbin`      | Herramientas de administración no esenciales (ej. `apache2`, `sshd`).             |
| `/usr/lib`       | Bibliotecas para los binarios en `/usr/bin` y `/usr/sbin`.                        |
| `/var`           | Archivos variables como logs, colas de correo, bases de datos temporales, etc.    |

> 📝 **Nota**: Algunos sistemas modernos usan `/lib64`, `/usr/lib64` para bibliotecas en arquitecturas de 64 bits.

