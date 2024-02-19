# Colores de la consola

Es importante tomar en cuenta que Linux estuvo diseñado para correr en sistemas que no tenían muchos recursos por lo que ciertas cosas que parecen mundanas en los sistemas modernos como puede ser el control de colores, eran muy importantes controlar sobre todo para poder crear sistemas con inputs visuales más llamativos los cuales dependiendo el caso, eran super importantes para que ciertos elementos reasltaran. 

Lo que solemos conocer por "terminal" en realidad son emuladores de terminales ya que realmente los terminales son máquinas que gestionaban el input de los usuarios para poder interactuar con un sistema. Era una pieza de hardware que controlaba tanto el input como el output, pero esta solo se dedicaba a ello.

## ¿Qué es realmente una terminal?
La terminal, podemos añadirle capacidades o quitarselas mediante la variable de entorno TERM la cual nos permite modificar ciertos aspectos de la misma o cambiar ciertos comportamientos que esta pueda tener.

Para listar todas las posibilidades que tenemos en nuestro sistema para modificar mediante TERM podemos ejecutar el comando `toe` el cual nos lista todas las opciones que nuestro sistema nos puede ofrecer. **Si el comando no muestra nada, debemos añadir la flag -a para verificacar todas las posibles opciones**

## Como se maneja la salida de texto de una terminal

Como ya hemos visto, antiguamente el concepto de pixeles y el resto de conceptos modernos referentes a las UI no aplicaban para las terminales ya que estos eran sistemas con recursos muy limitados por lo que ciertos elementos se debian manejar de forma muy especial para que funcionara correctamente.

Para modificar la fuente, los colores y demás aspectos de una terminal, se usa algo llamado escapado de secuencias. Son ciertos escapados de texto que la terminal interpreta y usa para mostrar cosas en pantalla.

Podemos listar todas las posibilidades que tiene nuestra terminal relacionadas con la consola con el comando infocmp

### Modifcando los colores

Para modificar el comportamiento de la salida de texto haremos lo siguiente:

En el comando echo con la flag -e podemos autorizar el escapado de texto, luego para modificar pasamos los siguiete:

`echo -e "\e[30;40m"`

Desglozando podríamos decir lo siguiente: `\e` inicia el escapado, `[30;40m` modifica el comportamiento de la terminal. Siendo los primeros dígitos los relacionado con el Foreground o texto y los segundos con el background o el fondo.

## Comando tput para mejorar el DX

Se sabe que para cambiar el formato de texto de la terminal mediante el escapado es un poco engorroso y que es dificil de memorizarse todas las combinaciones posibles que tiene la terminal, con anterioridad hemos visto el uso del comando infocmp, este comando podemos ver que tiene una nomenclatura parecida a `kri=\E[1;2A` para poder usar esto como variables utilizamos el comando tput el cual nos ayuda a modiifcar las salidas de forma mucho má eficiente.

Hay ciertos comandos que interactuan con la consola y modifica su comportamiento como es el caso de el comando `clear`siendo este el que se encarga de limpiarla. Lo que hace clear es simplemente escapar una secuencia que la consola interpreta como limpiar siendo el escapado el siguiente `ESC[HESC[J`, cuando la consola recibe esta secuencia inmediatamente borra todo el contenido de la misma.

Para evitar que tengamos que memorizarnos todas las secuencias, tenemos el comando tput el cual nos ayuda a acceder a las variables de infocmp y con ellas poder escapar el texto que querramos modificar. 

`echo "$(tput bold)This is bold"`

Para cambiar el color de la fuente podemos usar el atajo `setaf` y para el color de fondo utilizamos `setab` seguidos de un número indicando el cambio de la misma.

## Error en al terminal para ciertos sistemas

En algunos sistemas podemos encontrarnos que cuando modificamos la variable PS1, la terminal se comporta extraño, no hace los saltos de línea donde debe entre otras cosas. Para evitar esto, debemos introducir una secuencia especial para la variable PS1 para las secuencias escapadas.

Si quieremos utilizar secuencias escapadas debemos arroparlas con lo siguiente \[<secuencia>\]. Con esto evitamos los comportamientos extraños que tiene la consola.

Debemos tener cuidado con los espacios tanto al inicio como al final de la secuencia especial.
