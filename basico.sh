#!/bin/bash
# En este archivo ser verán los comandos más básicos que puedes utilizar en linux 
# Y alguna que otra anotación importante.

# pwd -> Te permite saber la ruta en la que te encuentras actualmente.
echo "ejecutando pwd:"
pwd

# man -> Este comando te permite visualizar la documentación de los comandos en linux

# ls -> este comando nos sirve para poder listar los directorios y los archivos que se encuentran en el directorio
# en el que te encuentras actualmente.

# root -> el usuario root es el usuario que contiene los permisos máximos del sistema.
# Este tiene permitido modificar y realizar cualquier acción sin ninguna restricción

# touch -> este nos permite crear un archivo vacío. Algo importante es que en linux es que todos los archivos son 
# potencialmente ejecutables. Si ejecutamos touch y mandamos un archivo que ya ha sido creado, este cambiará su fecha
# de modificación.

# rm -> Este comando nos permite eliminar un archivo en concreto.

# cp -> nos permite copiar un archivo. Como primer argumento, enviamos la ruta del archivo que deseamos copiar,
# y el segundo argumento, indica la ruta donde queremos que el archivo sea copiado.
# También podemos copiar directorios completos, pero esto solo lo podremos hacer si indicamos con el flag -r.

# mv -> Este comando nos permite mover un archivo desde una ruta hacia otra. Esto siguiendo el mismo comportamiento,
# que el comando cp, siendo el primer argumento el archivo o el directorio que deseamos mover, y el segundo la 
# ruta de destino del directorio donde queremos que el archivo sea copiado. También debemos indicar con el
# flag -r si deseamos mover un directorio completo.

# mkdir -> Este comando nos sirve para crear un nuevo directorio.

# rmdir -> Este comando nos sirve para eliminar un directorio. Siempre y cuando este vacío. Si deseamos
# eliminar una carpeta que dentro contenga archivos, debemos utilizar el comando "rm -r".

