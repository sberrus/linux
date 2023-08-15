#!/bin/bash

# arrays ... arrays. La forma de declarar los arrays en bash es abriendo paréntesis y se separan por espacios. EJ:

MY_FIRST_ARRAY=(one two three four five)


# Para leer imprimir el contneido de un array en consola se hace de una forma peculiar, ya que si ejecutamos simplemente "echo $MY_FIRST_ARRAY" va a devolver el primer valor del array que queremos ver. Si queremos observar el array entero debemos hacer los siguiente:

echo
echo Observando todos los valores del array:
echo ${MY_FIRST_ARRAY[@]} # Ahora si se van a mostrar todos los valores que contiene este array.

# Para acceder a un elemento en especifico lo hacemos de la forma usual pidiendo entre corchetes el indice al cual queremos acceder. Hay que tomar en cuenta que el primer indice es el 0.

echo
echo accediendo al primer elemento del array:
echo ${MY_FIRST_ARRAY[0]}

echo
echo accediendo al tercer elemento del array:
echo ${MY_FIRST_ARRAY[2]}

# 
echo