# System updates handling

Linux cada cierto tiempo necesita como toda pieza de software actualizarse, esto lo hacemos mediante el comando `apt upgrade` el cual lo que hace es comprobar los paquetes que pueden ser actualizados y los actualiza. Cabe mencionar que se recomienda cada vez que se vaya a realizar un `upgrade`, que se haga un `update`; esto con el fin de actualizar los repositorios y descargar la informaciómn actualizada de los paquetes.

Al realizar un `update` el sistema va a comprobar las librerias que necesiten ser actualizadas y va a avisar al usuario si desea realizarlo.

Las librerias antiguas no son eliminadas del sistema por temas de compatibilidad y de debuggeo del mismo.

## full-upgrade / dist-upgrade

Este tipo de upgrades se encargan de que dependiendo el caso, desinstala las librerias que ya no son necesarias para que funcione un paquete. Esta forma de hacer upgrades es más compleja y ayuda a que ciertos programas no tengan conflictos entre paquetes. Pero puede ocurrir que dependiendo el paquete que se desinstale, otros programas puedan verse afectados, por lo que siempre debemos aprender bien como instalarlos para que en caso de que se tenga que reparar algo sepamos donde indagar correctamente.

## Auto removing

Este comando elimina todas esas librerias que ya no son necesarias, es útil para cuando tenemos problemas de almacenamiento en sistemas con recursos limitados.

## Fichero de lista de repositorios

Este fichero es el que se encarga de listar los repositorios de los cuales el sistema va a depender a la hora de instalar software. Cuando se hace un `update`, el sistema busca la lista de repositorios en los siguientes ficheros:

- /etc/apt/sources.list
- /etc/apt/sources.list/\*

Estos ficheros son los que lee el sistema para buscar los repositorios que contienen la inforamción necesaria para los procesos de actualización del sistema.

Al entrar a estos ficheros nos vamos a encontrar a una lista de instrucciones que detallaremos a continaución

```línea en fichero /etc/apt/sources.list
deb http://archive.ubuntu.com/ubuntu/ jammy main restricted
```

La estructura de cada línea es la siguiente:

<type> <uri> <distribution> <domain1> <domain2> ...

- type:
	- deb: indica que el repositorio contiene paquetes binarios.
	- deb-src: indica que el repositorio contiene codigo fuente de paquetes.
- uri: La dirección del repositorio.
- distribution: Es el tag de la distribución de ubuntu o de linux que estamos utilizando. En estos podemos encontrar cosas como `-updates` o `-backports` los cuales indican que ese tipo de distro va a ser utilizado para tareas de mantenimiento o de retrocompatibilidad.
- domain[#]: Los dominios son el tipo de software que queremos instalar, estos dominios pueden ser (main, restricted, universe, multiverse). Esto indica la fuente de que tipo es, puede ser soportado por cannonical o de la comunidad, pagos o gratuitos, dependiendo del tipo de sofware, este tendrá los dominios que sea necesario.

### Repositorios de fuentes externas

Estos son repositorios que podemos integrar a nuestro sistemas que van a tener las mismas capacidades de los repositorios oficiales. Estos los añadiremos en el directorio `/etc/apt/sources.list.d` siendo este el encargado de almacenar los repositorios externos que vamos a necesitar.

Para añadir un nuevo repositorio, usualmente se incluye una clave GPG añadiendo una capa extra de seguridad y fiabilidad a los repositorios externos.

Estos repositorios tienen la capacidad de actuaslizar y modificar los paquetes dentro de nuestro sistema, por lo que deberemos ser cuidadosos a la hora de instalar y configurar estos repositorios externos.

Por lo general, en las páginas de instalación de los repositorios, suelen estar las intrucciones para poder instalarlos correctamente.
