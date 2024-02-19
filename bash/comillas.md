# Las comillas en bash

Las comillas en bash se deben tratar de forma diferente a como se tratan en otros lenguajes de programación o sistemas. Ya hemos visto que las comillas dobles permiten expansiones de diferentes tipos y las simples permiten devolver texto puro, pero no es tan simple como eso. En el siguiente ejemplo veremos en detalle màs al respecto.

1. `cat $PWD/*.txt`
2. `cat '$PWD/*.txt'`
3. `cat "$PWD/*.txt"`

Explicaremos las diferencias entre los 3 comandos de arriba.

En el primer caso, si va a realizar la expansión de nombre de fichero debido a que esta lo permite.

En el segundo caso, solo imprimira el texto como string.

En el tercero, con las comillas dobles, solo permite expansioens de variables y de parámetros. El resto no los permite. Este es el caso más espeical debido a que la variable si la va a extender, pero el `*` va a ser tratado tal cual. Por lo que no nos permitirá expander el nombre de ficheros.

Otra cosa importante es que las comillas simples no permiten escapado de caracteres por lo que debemos tenerlo en cuenta.

## Hay que tener cuidado con las expansiones

Antes que nada veamos cual es el orden de procesos que se realiza cuando vamos a ejecutar un comando.

1. El comando realiza las expansiones necesarias.
2. Luego realiza el separado de textos y la sanitización.
3. Se eliminas las comillas simples y dobles.
4. Se ejecuta el comando con sus respectivos argumentos.

Debido a ello debemos tener cuidado con los comandos que ejecutamos y como realizamos las expansiones porque si tenemos por ejemplo un fichero que tiene como nombre el mismo nombre que un comando, siguiendo el orden de procesos, si el el primer string coincide con el nombre de un comando, este se ejecutará. Por lo que si el primer string coincide con un comando, este se ejecutará.

Digamos que queremos ejecutar en la consola `*` y tenemos un fichero llamado echo, el comando se ejecutará.

Para evitar problemas, se aplica la buena práctica de si queremos usar el `*` lo indiquemos de la siguiente manera `./*` de esta forma nos evitamos que se ejecuten comandos inesperados. 

Otra buena prática es que se utilizen comillas dobles siempre que queramos usar extensión de variables para evitar problemas principalmete con los espacios que se pueda encontrar.
