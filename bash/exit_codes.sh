#!/bin/bash

# EXIT CODES
# Al finalizar la ejecución de un script, este almacena en la variable $? el exit_code de la última ejecución que se ha ejecutado. Hay ## exit codes los cuales envían cierta información como respuesta para poder trabjar con estas. **ALGO PARECIDO A LOS HTTP_RESPONSE_CODES en las solicitudes HTTP.
# Los principales códigos de error son el 0 indocando OK, y el 1 indicando ERROR, aunque hay mas errores.

check_name(){
    echo hello $1
    if [ ${1,,} == samuel ]; then 
        return 0
    else 
        return 1
    fi
}

check_name $1

if [ $? == 1 ]; then
    echo "No cuentas con los permisos necesarios para ejecutar esta operación"
fi