# SORT UNIQUE

Dos comandos útiles de linux son sort y unique.

sort: Nos permite ordenar un fichero línea a línea permitiendonos escoger de ser necesaria la columna que deseamos ordenar.

Para el ejemplo, en este directorio hay una directorio llamada `files` el cual tiene listados los ficheros de la ruta principal de anotaciones y las directorios.

Los flags destacados del comando son los siguientes:

default: ordena alfabéticamente

-r: Ordena alfabéticamente pero de manera opuesta.

-n: ordena númericamente.

-c: Comprueba si el fichero ya ha sido ordenado previamente.

-k <column_number> *empezando por 1*: Permite seleccionar la columna a ordenar. Cabe destacar que la "columna" se refiere a el texto separado por espacio, por lo que "columna1 columna2 columna3 ... columna9"

uniq: El comando uniq nos permite eliminar valores duplicados, pero este debe tener una condición. uniq lo que hace es que evalua si un valor es igual a otro pero comparando siempre el valor que esta evaluando con el siguiente que encuentre. Por lo que primero siempre deberemos ordenar los elementos antes de pasarlos por el comando uniq para que funcione correctamente.

También con el comando sort, podemos usar la flag -u la cual hace lo mismo. Primero ordena y luego elimina los duplicados.

Las flags destacadas de este comando son:

-d: Devuelve los valores duplicados que se haya encontrado.

