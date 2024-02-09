# GREP

El comando grep nos permite buscar texto o coincidencias dentro de un archivo de texto o una entrada.  

La forma más normal de usarla es la siguiente: `grep -F 'pattern' file.txt` lo que hará es buscar el patrón `patter`en el archivo.

Cabe destacar que predeterminadamente, grep utiliza regex simple para realizar las buquedas, esto lo podemos modificar con las flags -F -G -E

Flags destacadas:

-F: realiza la busqueda utilizando solo patrones de texto *sin regex*


** Con grep, tenemos la habilidad de buscar en archivos binarios pero no esta creada para ello :)
