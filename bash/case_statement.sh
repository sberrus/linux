#!/bin/bash

# case statement de toda la vida pero con su sintaxis particular
# En el caso de las case statement la sintaxis es particular, primero la definimos con la kw "case" seguido del valor que se va a evaluar en las condicionales. Luego escribimos la kw "in" seguido de los valores que van a ser evaluados.
# Para mejorar su legibilidad, se pone en una linea separada cada uno de los casos que se van a evaluar y cerramos los valores a evaluar en dicho caso con ")".

clear

case ${1,,} in # Abrimos la sentencia.
    samuel | alberto) # Primer caso. Se va a evaluar que el primer argumento pasado al script y formateado a minusculas, sea samuel | alberto
        
        # codigo a ejecutar si se cumple la condición.
        echo "Welcome ${1,,} you are logged in succesfully!"

        ;; # Con ";;" indicamos cuando finaliza el bloque de código que se piensa ejecutar en dicho caso.

    admin) # caso 2
        echo "Welcome ${1,,} you are the administrator, all permissions available"
        ;;
    
    *) # default, Esta opción va a ejecutarse en el caso de que no haya ningún caso que cumpla con la condición.
        echo -e "\aSorry user not valid, please try again"

esac # "esac" que es "case" al reves, sirve para indicar el cierre del case statement 

echo