# Standard streams

En bash hay 3 formas de comunicar información hacia dentro o fuera del sistema, stdin, stdout, stderr.

Dependiendo de como se gestione cada canal de salida, podemos redirigir el output y gestionarlo como prefiramos.

## Tipos de canales

### STDIN standard input (0)

El stdin, se refiere a la información que tu como usuario ingresas al sistema ya sea mediante el teclado o lo que sea. 

### STDOUT standard output (1)

El stdout, se refiere a la información que el sistema nos devuelve a nosotros como usuarios ya sea por la terminal, las bocinas etc...

### STDERR standard error (2)

El stderr, se refiere a la información de errores, que devuelve el sistema.

## streams o redireccionamiento de output ">" ">>"

Los redireccionamientos, son la habbilidad que tiene linux de redirigir el output de un comando y almacenarlo en un fichero.

Hay 2 formas de redirigir mediante > y >>. 

La diferencia entre ambos es que > lo que hace es capturar el output y lo introduce en un archivo que definimos. Si vuelves a usar el stream > y apuntas a un archivo existente, este va a reescribir todo el archivo y perderas el contenido del anterior

En cambio con >> vas introduciendo linea a linea tantas veces hayas definido.

## Manejando strams de errores.

Los streams de errores los podemos gestionar usando insertando el número 2 antes del tipo de stream ej: 2> o 2>>. Teniendo el mismo comportamiento pero solo gestionando los errores.

## ruta /dev/null

Esta ruta es como una especie de agujero negro. Por lo que si queremos que un output directamente no se imprima en pantalla podemos utilizar `2>/dev/null`. De esta forma todos los errores serán redirigidos a dicha carpeta y no se mostrarán en ningún lado.

## Combinando operadores

También podemos utilizar ambos operadores para poder manejar dichos outputs por loq ue si ejecutamos `<comando> > log.out 2> /dev/null` lo que estaríamos haciendo es ejecutar un comando y el `stdout` lo va a almacenar en el archivo `log.out` y el stderr va a terminar en el agujero negro.


