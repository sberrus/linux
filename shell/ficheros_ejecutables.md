# Archivos ejecutables.

Viendo principalmente la importancia de la variable PATH siendo esta la que se encarga de definir las rutas donde se encuentran los archivos ejecutables, podemos definir un archivo ejecutable global simplemente añadiendo la ruta donde se aloje dicho archivo en el sistema a la variabla PATH y luego, dandole los permisos necesarios con el comando `chmod +x <ejecutable>`.

## Definiendo el entorno del ejecutable.

El shebang, podemos definir que entorno va a interpretar el comando que vamos a ejecutar, por ejempplo, si queremos ejecutar un archivo python, podemos directamente definir el shebang de la siguiente manera:

#!/usr/bin/env python3

De esta forma estaríamos indicando que el script que se va a ejecutar va a ser interpretado por el comando python3.

