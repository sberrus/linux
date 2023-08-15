#!/bin/bash

# Los outputs redirections son una capacidad que tiene bash para controlar las salidas de los comandos y almacenarlas en archivos que deseemos. 

# Tenemos 2 tipos de outputs redirections. Si usamos el caracter > estamos indicando que el output va a ser almacenado en un archivo reescribiendo todo lo que este contenga dentro de si.

echo "Texto de prueba (Este no se va a ver en el archivo)" > write_file
echo "Texto de prueba (Este texto si se va a ver en el archivo)" > write_file

# Al ejecutarse los dos scripts de arriba solo se va a ver almacenado el contenido del segundo script ya que este último esta reescribiendo todo el archivo.

# Los redirects de añadir a archivo son aquellos que van seguidos de un >> indicanddo de que el contenido debe qquedar intacto y que solo añadira el contenido debajo del mismo.

[ -f append_to_file ] && rm append_to_file # para que borre el archivo en cada ejecución para poder ver mejor su funcionamiento. 

echo "Linea 1" >> append_to_file
echo "Linea 2" >> append_to_file
echo "Linea 3" >> append_to_file
echo "última linea" >> append_to_file