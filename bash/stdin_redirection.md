# Redirigiendo STDIN a un archivo

Como ya sabemos, stdin se refiere a todas las interacciones que nosotros como usuarios tenemos con el sistema, en este caso veremos como podemos capturar las interacciones del usuario para pasarlas a comandos.

Se ha visto con anterioridad que los std.. tienen un orden siendo 0 > 1 || 2. Por lo que el primer standar input es lo que el sistema recibe a la hora de pasar un comando.

Cuando ejecutamos `wc -l` sin archivo de input, lo que va a hacer el sistema es escuchar el stdin y luego pasará lo que le indiquemos al comando wc -l

Hay ciertos programas que permiten recibir stdin como input, por lo general todos los programas que interpretan texto, tienen la capacidad de leer los stdin.

## Uso de el operador < para pasar archivos a un comando
Otra de las formas que tenemos de pasar stdin a un comando, es usando el operador < seguido del fichero que deseamos tratar; por lo que es igualmente válido usar `cat file.txt` que `cat < file.txt`.

También tenemos la capacidad de concatenar redirecciones de la siguiente manera `cat < somefile.txt > result.out` Por lo que no habría ningún problema.
