# Tipos de expansiones

Existen otros tipos de expansiones que no hemos visto como:

## Brace expansion

Estos son expecialmente útiles para cuando queremos indicar valores distintos en una misma posición dentro de una expansión. 

Estas expansiones no funcionan dentro de comillas.

Por ejemplo, supongamos que queremos hacer un cat a todos los elementos .txt y .md de una ruta. Para esto utilizaríamos el siguiente comando:

`cat data.{txt,md}` -> Devuelve todos los elementos con extensión .txt y .md

Esto funciona sin importar si hay otras extensiones presentes en la declaración. Por lo que `cat /some/route/*/${filename}.{txt,md}` También es podría ser válida.

También podemos imprimir valores indicando un valor inicial y uno final separados por tres puntos seguidos '..' {start..end}

{a..z} -> Imprime todos los valores desde la 'a' hasta la 'z'.
{0..200} -> Imprime todos los números entre 0 y 200 incluyendolos, también permite números negativos. Estos pueden servir para referenciar archivos que contengan una asiganción númerica secuencial.

Si por algún motivo necesitas acceder a algun dato que necesites mediante comillas, lo que puedes hacer es separar el fragmento que necesite las comillas y seguido, según sea el caso, introducir la expansión.

## Commando substitution

Esta expansión nos permite ejecutar dentro de esta un comando y tomar su output como valor. Esto se logra mediante de $(<comando>)

`cat "$(cat file.txt)"`

Es realmente útil para cuando quieres mostrar textos y mostrar el resultado de un comando en una sola línea. `echo 'The size of my home directory is: '"du -sh ~"`

Otra forma de crear command substitution es con el uso de '\`' pero no se recomienda debido a que es menos legible en comparación a `$()`.

```
echo "The current directory have `ls | wc -l` files in it"
```

El script de arriba es completamente válido

## Process substitution

Esto se refiere a la capacidad de bash de usar stdin como un archivo temporal para usarlo en otro archivo. 

Esto es útil para cuando queremos comparar 2 directorios para saber que diferencias tienen uno del otro. 

Para ello, podemos hacer lo siguiente. redirigiendo la salida del comando ls en cada uno de los directorios, podemos pasar ambos archivos por el comando `diff` y con esto podemos ver las diferencias.

Pero en el supuesto que no querramos crear un archivo nuevo o querramos que funcione de otra forma podemos hacer lo siguiente:

```
echo <(ls) -> /dev/fd/63 -> Esta es la ruta del archivo temporal que ha creado el <().
``` 

Lo que hace el script de arriba es pasarle el output del comadno ls como archivo al comando echo. 

Por lo que si queremos realizar lo mismo que habíamso dicho antes pero con el Process Substitution podemos ejecutar el comando de la siguiente forma:

```
diff <(ls ./folder1) <(ls ./folder2) -> Esto pasara como 2 archivos temporales con el output de los dos ls y los utilizará diff para compararlos. Esto es útil porque diff solo acepta archivos para comparar
```
