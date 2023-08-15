#!/bin/bash

# uso de if, elif, then, else y fi. Estos son KW que se utilizan para crear condicionales a la hora de crear scripts en shell. Esto nos sirve para declarar más legiblemente cada uno de los bloques de código que se piensan declarar en los scripts.
clear

echo "Ingrese usuario:"
read user

if [ $user = "admin" ]; then
    echo "User admin logged"
elif [ $user = "samuel" ]; then
    echo "User samuel logged"
elif [ $user = "" ]; then
    echo "You should enter any user"
else 
    echo -e "User \033[31m$user\033[0m not found or not valid, try again!"
fi