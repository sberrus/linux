#!/bin/bash

# Funciones en bash. Al igual qeu en otros lenguajes de programación, podemos crear funciones para poder modularizar y mejorar la legibilidad de nuestro código. Esto con el fin de poder crear código más limpio y escalable.

# decorator
printdecorators(){
    decorator=""
    for ((i = 1; i <= $(tput cols); i++)); do
        decorator+="-"
    done
    echo $decorator
}

# declarar una funcion
myfirstfunction(){
    clear
    # la kw `local` nos ayuda a definir
    local up=$(uptime -p | cut -c4-)
    local since=$(uptime -s)
cat << EOF
------------------------
Esta máquina ha estado operativa ${up}
Desde ${since}
------------------------
EOF
}

myfirstfunction

# Pasarle argumentos a las funciones
# Para pasarle argumentos a las funciones lo hacemos también usando los argumentos posicionales como haríamos en un script bash.

print_name(){
    echo hola - $1 - $2
}

print_name "Samuel Berrus" "Este es el segundo argumento posicional"