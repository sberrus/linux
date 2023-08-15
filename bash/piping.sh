#!/bin/bash

# piping es una caracteristica que tiene bash para poder utilizar como input de un comando el output de otro comando ejecutado anteriormente.

cat introductorio.sh | grep "le"

# En el ejemplo anterior podemos observar que estamos ejecutando cat para ver el contenido de introductorio.sh y luego usamos grep para que nos devuelva todas las líneas que contengan la cadena de texto "le" para filtrarlas.