#!/bin/bash

# En bash hay variables especiales que contienen información o datos que el ususario nos puede pasar a la hora de ejecutar el script o de realizar algún llamado dentro de otro script.

# Los argumentos posicionales son datos que se le pueden pasar al script ya sea mediante input directo del usuario o mediante la ejecución del mismo.

# Los argumentos posicionales son aquellos que estan seguidos del $[#POSICION].

# Supongamos que tenenos el siguiente script -> script.sh, si queremos pasarle datos mediante argumentos posicionales, debemos pasarselos separados por espacios despues de la ejecución del script. ej: ./script.sh ARGUMENTO_1 ARGUMENTO_2 "Cadena de texto pasada como argumento". Estos argumentos los recoge el script de la siguiente forma: 

# $0 -> nombre del script -> script.sh
# $1 -> argumento en posición 1 -> ARGUMENTO_1
# $2 -> argumento en posición 2 -> ARGUMENTO_2
# $3 -> argumento en posición 3 -> "Cadena de texto pasada como argumento"

echo "Viendo los argumentos pasados a este script:"
echo "--------------------------------------------"
echo
echo "nombre del script -> $0"
[ -z "$1" ] && echo "argumento 1: vacío" || echo "argumento 1: $1"
[ -z "$2" ] && echo "argumento 2: vacío" || echo "argumento 2: $2"
[ -z "$3" ] && echo "argumento 3: vacío" || echo "argumento 3: $3"
[ -z "$4" ] && echo "argumento 4: vacío" || echo "argumento 4: $4"