# Manejo de dependencias

El manejo de dependencias se refiere a la capacidad que tiene le sistema para comparar que dependencias son necesarias para un programa para funcionar correctamente. Puede existir el caso en el que dos librerias necesiten una misma dependencia pero en versiones diferentes. Por lo que no se instalan las dos, sino que se instala la más reciente siempre y cuando todos los programas satisfagan sus versiones de dependencias. 

Pero hay veces en las que puedne surgir problemas de dependencias por difernetes motivo, por lo que en esta sección veremos como poder encontrar cual es el problema y como resolverlo.

## Ver dependencias de un programa

Para ver las dependencias de un programa instalado usamos el comando `apt show <programa>` o en el caso de querer usar una versión más legacy usamos `apt-cache show <programa>`. De esta forma podemos ver la información del programa en cuestión, además de las dependencias de este programa.

Las principales datos que nos interesan para este tema son los siguientes:

- Pre-Depends: Estas dependencias son necesarias antes de realizar la instalación del programa en nuestro sistema. Sin estas dependencias, la instalación del programa no va a funcionar correctamente.
- Depends: Son las dependencias directas del programa. Sin estas dependencias el programa no va a funcionar correctamente.
- Recommends: Son dependencias que no son necesarias para la funcionalidad del programa, pero se recomiendan. En sí son programas que si bien no son necesarios para la ejecución, si suelen ser beneficiosas para el mismo. 
- Suggests: Son las dependencias sugeridas. No son realmente necesarias pero mejoran la experiencia o la eficiencia del programa.
- Conflicts: Dependencias que se sabe que suelen chocar con otras dependencias dentro del programa.

Se debe tener en cuenta que las dependencias listadas en Pre-Depends, Depends y Recommends; se instalan automáticamente cuando descargas e instalas la libreria. El resto son opcionales.

## Resolucion de conflicto entre dependencias

