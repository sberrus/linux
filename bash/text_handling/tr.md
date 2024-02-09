# tr

El comando tr, nos permite modificar el texto que le pasamos como input por lo que nos permite realizar reemplazamientos en un archivo como el siguiente:

```bash
echo 'bash' | tr 'b' 'x' -> xash
```

En el ejemplo anterior, lo que hace es reemplazar las letras 'b' por las letras 'x'.

Lo que hay que tener en cuenta es que los reemplazamientos van a ser a nivel de caracteres, por lo que si por ejemplo vamos a pasar como argumentos al comando 'bg' 'example' lo que va a hacer es reemplazar los caracteres que coincidanpor ejemplo 'bg_dar' va a ser reemplazado por 'ex_dar' por lo que el resto de caracteres del segundo parámetro van a ser omitidos.

Para reemplazar una palabra o substring por otro, debemos hacer uso del comando sed que se verá más adelante.

Otra de las cosas que podemos hacer con el comando tr es transformar texto de minusculas a mayusculas pasando como argumentos `tr 'a-z' 'A-Z'` De esta forma lo que le pasemos como input va a cambiar.

Con el comando -d podemos indicarle al comando tr que elimine carácteres o patrones.
