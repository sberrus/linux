#!/bin/bash

# Tenemos dos formas de acceder a los datos pasados a un script, mediante positional arguments, en el caso de que queramos pasar argumentos de forma controlada. Pero en el caso de que queramos gestionar un archivo podemos usar la entrada estándar el cual lee el contenido del archivo y lo gestiona leyendo línea a línea.

contador=1

while IFS= read -r linea; do
    echo "Linea $contador: $linea"
    contador=$((contador+1))
done

# De esta forma podemos leer el archivo y linea a linea revisar su contenido y trabajar con él.


# Otra de las formas que tenemos para observar el contenido de un documento o de una cadena de texto es mediante <<. Esto lo hacemos indicando donde finaliza el texto que queremos que le script lea.

# Haciendo uso de esta input redirection, podemos escribir manualmente texto que no va a finalizar hasta que escribamos la cadena de control. Pongamos como ejemplo el siguiente ejemplo. cat << EOF. **siendo EOF un estandar para indicar que el archivo a finalizado***. Lo que va a hacer es abrir un editor de texto el cual nos permitira esciribir texto en la consola. Esto va a dejar que escribamos texto hasta que escribamos la cadena EOF sola en una de las lineas. Al escribir EOF se va a enviar todo el texto que hayamos escrito en la consola y lo enviará al comando cat.

# cat << EOF
# > hola mundo 
# > esto es
# > una prueba 
# > EOF 

# Al escribir eso va a aparecer en pantalla, todo el texto que se ha escrito hasta la cadena EOF.

# La tercera forma que tenemos para pasar argumentos es mediante <<<, este nos permite pasar una cadena de texto en vez de una cadena con multiples lineas. Es muy útil para cuando queremos pasar simplemente cadenas al comando.

# wc -w <<< "este es una cadena de texto de ejemplo"