#!/bin/bash

# FOR LOOP

# La sintáxis de los for loops es la siguiente:

ARRAY=(one two three four) # mock

# Primero iniciamos la sentencia con la kw "for" seguido de la variable que almacenará por cada iteración el valor del iterable en el paso consecuente; seguido de la kw "in", seguido del iterable que deseamos iterar. Luego ponemos un "; do" para indicar el inicio del bloque de ejecución de cada iteración. 
for item in ${ARRAY[@]}; do

    # En la sentencia podemos ver que hemos definido el valor de cada iteración en item el cual podremos acceder mediante dicha variable. Por lo que en la siguiente línea vamos a usar el valor de cada iteración y lo pasaremos por wl comando "wc -c" mediante piping para que cuente cuantos carácteres tiene el valor en cada una de las iteraciones.
    echo -e $item | wc -c

done # Cerramos la sentencia del loop con "done"