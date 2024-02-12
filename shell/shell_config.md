# Configurando la shell de bash

En bash tenemos ciertas configuraciones que podemos modificar con una serie de comandos internos de bahs los cuales nos ayudan con ciertas tareas como podrían ser el debugging de la shell oi de los scripts.

## comando `set`

El comando set nos permite modificar el comportamiento de la shell.

Que podemos activar y desactivar con estos comandos?

- `set -x`: Activa el xtrace. 

Es un modo de debuggeo que nos permite saber que se ha ejecutado antes de mostrar un stdout. 

Cuando esta activado nos muestra encima del stdout, el comando que se ha ejecutado. Es un modo útil para cuando se quieren hacer tareas de debuggeo.

### Donde buscar más opciones con set

En la página https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html se puede encontrar más información al respecto.

## Comando `shopt`

El comando `shopt` es usado para configurar como se debe comportar la shell en ciertos casos.

- habilitar `shopt`: `shopt -s [optname]` 
- deshabilitar `shopt`: `shopt -u [optname]` 

## ¿Porqué tenemos configuraciones para la shell?

Por motivos de compatibilidad, como anteriormente, la shell predeterminada era `sh`, esto lo que hace es que toda la configuración que tiene `sh` la comparte con las otras shell. Por ello debemos conocer como se comporta y que podemos hacer con esta.

- set: Modificamos las configuraciones heredadas de sh.
- shopt: Modificamos las configuraciones especificas de shopt.

## Algunas Configuraciones

- autocd: Permite cambiar automaticamente de directorio sin usar el comando `cd`.
- cdspell: Permite que si hay algún caracter que difiera del directorio al que queremos acceder, nos permite autocompletar automaticamente el nombre del directorio.

## Más información

https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html


