# Las variables de entorno


## Varaible PATH

Path define las rutas que va a utilizar el sistema para alojar los archivos ejecutables. Los archivos ejecutables que se encuentren en path, van a poder ser accedidos desde cualquier parte del sistema.

Podemos modificar la variable PATH siempre y cuando respetemos las rutas críticas del sistema.

## Variable SHELL

La variable SHELL es la que define que programa va a utilizar como shell por defecto a la hora de definir una consola.

## Variable PS1
La variable PS1 es una variable es una variable especial que nos e especial que nos permite modificar e l comportamiento de el texto que aparece al lado de el prompt de la consola.

Esta variable tiene ciertos valores especiales que automaticamente se escapan, los valores son los siguientes: 

- \u: Nombre de usuario actual.
- \h: Nombre del host hasta el primer punto.
- \H: Nombre completo del host.
- \w: Ruta completa del directorio actual.
- \W: Nombre del directorio actual.
- $: Símbolo del prompt ($ para usuarios regulares, # para usuarios root).
- \: Un carácter de barra invertida (\).
- \t: Hora actual en formato de 24 horas (HH:MM:SS).
- \T: Hora actual en formato de 12 horas (HH:MM:SS).
- \d: Fecha actual en el formato "día de la semana mes día".
- \n: Nueva línea.
- \r: Retorno de carro (mueve el cursor al principio de la línea). 

Si es verdad que con el escapado tenemos varios atajos quenos pueden servir, a su vez, podemos ejecutar cualquier comando que querramos de ser necesario.
