# cut

Con el comando cut, lo que podemos hacer es extraer un fragmento de texto de una salida de un comando. Esto lo hacemos de diferentes formas como puede ser con los siguientes flags:

-b #-#: Este comando nos permite cortar la salida por bytes, esto significa que si pasamos un comando `comando | cut -b 1-15`, lo que va a hacer es extraer la salida carácter por carácter desde la posición 1 a la 15, osea las primeras 15 líneas. Tener en cuenta que se empieza desde el número 1.

-c #-#: Esta flag nos permite hacaer lo mismo que -b con la diferencia que este si nos permite extraer por carácter.
La diferencia entre ambos radica en los caracteres especiales, ya que hay caracteres que tienen más de 1 byte como podrian ser ö o los acentos íáúó ya que estos son representados por más de 1 byte.

- Si deseamos obtener solo un carácter en una posición en especifico solo debemos pasarle la posición sin el '-'.
- Si queremos obtener desde una posisición inicial hasta el final, indicamos la posición seguido del '-' indicando que continue hasta que finalice la línea.
-d '<delimitador>' -f <n_columna>: Si queremos capturar elementos meidante columnas, debemos hacer lo siguiente. Con la flag -d seguido de el limitador ' esto nos permite definir que elementos va a utilizar cut para separar elementos. Luego, junto con el comando -f definimos cual de las columnas va a utilizar. Por lo que si queremos obtener la primera columna separada por espacios en blanco, debemos pasar el comando de la siguiente manera `<comando> | cut -d ' ' -f 1`. Tener en cuenta que si el input empieza con un espacio en blanco al principio, el -f 1 va a estar vacío.

También podemos extraer varias columnas simultaneamente usando `cut -d ' ' -f < 1-5 | 3- > indicando que sea desde la columna 1 hasta la 5 o que desde la columna 3 en adelante.

