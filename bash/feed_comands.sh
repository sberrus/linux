#!/bin/bash

# Hemos visto que una de las formas que tenemos para pasarle datos a los comandos es mediante positional arguments pudiendo acceder a estos en el script haciendo uso de las $.
# Otra de las formas que podemos usar para poder pasarle información, principalmente cuando queremos pasar un archivo a un comando, es haciendo uso de < y <<. 

# En el siguiente ejemplo queremos ver el conteo de palabras que contiene el archivo write_file haciendo uso de positional arguments.

clear
echo "Usando positional arguments:"
echo "----------------------------"
wc -w write_file

# Al ejecutarse comando veremos que el script imprime el total de palabras que encuentra y el nombre del archivo. Pero como podemos hacer para que solo nos imprima la cantidad de palabras sin el nombre del archivo?. Esto lo hacemos mediante el uso de < o << como veremos en el siguiente ejemplo

echo
echo "Usando feed:"
echo "------------"
wc -w < write_file