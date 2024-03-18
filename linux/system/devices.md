# Dispositivos

Como se ha dicho anteriormente, en linux, todo son ficheros, pero no es del todo así. Citando a Linus Torvalds:

"Everything is a stream og bytes" 
- Linus Torvalds

La diferencia rádica en como y donde se almacenan los datos.

Los dispositivos son entidades físicas o virtuales los cuales nos permiten interacturar con ellos mediante una interfazparecida a un fichero. 

Unix se encarga de procesar la inforamción entre el sistema operativo y los dispositivos. También se encarga de manejar tanto la escritura como la lectura que el sistema o los usuarios tengan con dichos dispositivos y el sistema.

## Tipos de dispositivos

- Character devices (c): Mediante estos, podemos acceder directamente a los dispositivos de sin pasar por el buffer. 
- Block divices (b): Nos permite acceder a los dispositivos mediante buffer, estos buffer devuelven la información en bloques por lo que se procesa de forma diferente.
- pseudo devices: Son dispositivos que no tienen que ser necesariamente dispositivos físicos. Dependiendo del tipo puede ser (c) o (b).

## Tipos de pseudo dispositivos.

- /dev/null: Es una especie de agujero negro que tiene el sistema. Cuando redirigimos cualquier cosa a este dispositivo, el sistema directamente descarta todo el contenido o lo elimina del sistema.

- /dev/random: Este dispositivo nos devuelve información aleatoria de distintos puntos del sistema. Esto nos ayuda principalmente en tareas de críptográfia para generar llaves privadas con seeds aleatorias.

- /dev/urandom: Similar a /dev/random pero con información que es más simple y más rápida. Es menos segura para criptográfia.
