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

En esta sección veremos como se puede manejar las dependencias para resolver conflictos y como podemos gestionarlas.

Estos tipos de errores pueden pasar cuando se esta haciendo un `upgrade` del sistema, haciendo que este tenga este tipo de errores y hay que gestionarlos de manera correcta.

En el caso de que hayan problemas de compatibilidad en ciertas dependencias lo que podemos hacer es lo siguiente para resolver problemas de dependencias de manera manual:

- Lo primero que podemos hacer es intentar descargar de nuevo la dependencia con el flag -f a la hora de hacer el apt install el comando sería el siguiente: `apt install -f <dependencia>`. De esta forma estamos instalando la dependencia mediante `apt` mediante el uso de --fix-broken. De esta forma dejamos que apt maneje, gestione e instale las dependencias.

- La otra forma es instalar las dependencias una a una hasta que todas satisfagan las necesidades del paquete que estamos intentado instalar.

- Podemos también eliminar el paquete que esta generando los conflictos. Esto en el caso de que la prioridad sea la integridad del sistema.

- Podemos, en casos especiales en los cuales tengamos tiempo para comprobar que todo el sistema esta funcionando correctamente, hacer un update/full-upgrade al sistema para que este se encargue de tener todos los paquetes con las últimas versiones de todo.

### Recomendaciones para evitar problemas con las dependencias

Para evitar problemas con las dependencias cuando estemos trabajando con sistemas Linux, lo que debemos evitar es lo siguiente:

- Evitar usar repositorios de terceros.
- Evitar instalar dependencias .deb de ser posible.
- Intentar siempre que sea posible instalar las dependencias directamente desde el repositorio de ubuntu o de la distro que estes utilizando.
- Si se esta pensando en actualizar el sistema, siempre tomar en cuenta el tiempo necesario para realizar todas las actualizaciones necesarias.  
- Crear un backup completo del sistema antes de realizar cualquier tarea de actualización.
- Intentar usar las versiones LTS (Long Term Support) especialmente si estamos trabajando con algun servidor.
