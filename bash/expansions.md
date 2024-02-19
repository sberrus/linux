# Expansiones

Las expansiones nos permiten realizar operaciones complejas en bash.

Esto se vio antes cuando se vio el termino expansión de rutas. para rellenar rutas del tipo `ls */[1-9]somefile.txt`

En este caso veremos otros tipos de casos de uso para las expansiones en bash.

Se basa en la reescritura y parseo de ciertos comodines para realizar operaciones complejas.

## Las comillas importan

El uso de las comillas en bash tiene una función. Si usamos comillas simples `''` Esto indica a la shell que queremos enviar un string puro. Por lo que las expansiones no tendrán lugar dentro de las comillas simples.

El uso de comillas dobles `""` si nos permiten usar expansiones por lo que dependiendo de la situación, podemos utilizar un tipo de comillas u otro. En especial si deseamos hacer uso de las expansiones dentro de el string que estemos tratando.

## Expansiones en nombres de ficheros

- \*: Como se vio anteriormente, el * indica que haga match con todo los ficheros y carpetas que encuentre desde la ruta actual.

- ~: Esta expansión devuelve lo que se encuentre en la variable env de $HOME que suele ser el directorio home del usuario actual. Cabe resaltar que manualmente podemos modificar el valor de $HOME pero no se recomienda modificar dicha variable.

- ~+: Devuelve el contenido de $PWD.

## Expansiones de variables

Las expansiones de variables nos permiten usar variables dentro de un string. 

Supongamos lo siguiente:

```bash
valor=1

# Tipos de expansiones de variables
echo $valor
echo ${valor}
echo "$valor"
echo "${valor}"
```

Las cuatro formas anteriores de declarar una variable en bash devuelven lo mismo.

## Expansion de parametros de la shell

Este tipo de expansiones nos permiten saber diferntes cosas de un string por ejemplo:

- \#<var>: Nos permite saber el número de bytes de una variable

- ${<var>:start:lenght}: De esta forma podemos decirle que devuelva un string desde la posición start empezando por 0 del tamaño pasado por lenght.

- ${<var>/pattern/replacement}: devuelve un string el cual va a reemplazar la primera ocurrencia que coincida con la secuencia.

- ${<var>//pattern//replacement}: devuelve el string pero modificando todas las ocurrencias de la secuencia.


