# Package Manager RHEL
En esta sección se verán las recomendaciones para gestionar paquetes en sistemas Red Hat.

Los paquetes en redhat son .rpm

La página donde se encuentran todos los paquetes oficiales de redhat es `http://mirror.centos.org/`. En este sitio podemos encontrarnos con una interfaz parecida a un navegador de directorios en los cualesp odemos ver los distintos paquetes que estan registrados en REDHAT.

## Comando rpm

En esta distro, tenemos el comando `rpm` que nos ayuda a gestionar los paquetes .rpm y visualizar tanto sus ficheros internos y otras funcionalidades útiles para la gestión de paquetes en RedHat.

Para instalar un paquete .rpm hacemos uso del comando con las siguientes configuraciones `sudo rpm -i <ruta_al_binario>`. Para esto debemos tener privilegios de administrador para poder instalar los ficheros.

Con este comando podemos manejar todos los paquetes de manera sencilla, pero no es la forma más ideal de descargar ficheros en sistemas RedHat. Para este tenemos la herramienta `dnf` que es un simil a `apt` en ubuntu el cual permita además de instalar paquetes, permite manejar las dependencias de los paquetes y otras gestiones que manualmente son más complicadas de hacer.

## Comando dnf (dandified yum)

La herramienta `dnf` es una herramienta que permite manejar paquetes de redhat de manera comoda y eficiente. Este instala paquetes .rpm los cuales permiten que las distros redhat puedan trabajar con estos sin problemas.

Tiene muchas herramientas para manejo de paquetes como busqueda, listados, información, instalar, desistanlar, depurar entre otros. Además este se encarga automaticament de manejar las dependencias de los paquetes para que no tengas problemas a la hora de manejarlos.

### Manejando los repositorios en dnf

Para manejar los repositorios en dnf tenemos los ficheros `/etc/dnf/dnf.conf` o también podemos encontrarlos en `/etc/yum.rpeos.d/*.repo`.

En estos ficheros podemos ver tanto los repositorios internos que vienen preinstalados como los repositorios externos para paquetes nuevos.

En estos ficheros podemos definir tanto como va a compartarse dnf a la hora de gestionar los paquetes como la configuración de cada uno de los repositoios los cuales dependiendo el caso podemos definir ciertos permisos que detallaremos luego.

En el caso de centos, tenemos dos repos principales que son los que tienen la información del core del sistema los cuales son: `baseos, appstream`. Estos son los repos princiaples del sistema los cuales son necesarios para que este funcione correctmanete.

En el caso de RHEL, tenemos repositorios más especificos los cuales le dan esa capa extra de seguridad que necesitan los sistemas RHEL para garantizar la máxima seguridad y configuración segura posible.
tenemos repositorios más especificos los cuales le dan esa capa extra de seguridad que necesitan los sistemas RHEL para garantizar la máxima seguridad y configuración segura posible. Los repos son básicamente los mismos `appstream y baseos` la diferencia es que la nomenclatura que usa RHEL es ligeramente distinta.

### Dependencias en RPM

Las dependiencias de un paquete son piezas de software que el paquete en cuestión necesita para poder funcionar correctamente. Existen difernets tipos de dependiencias que puede tener un paquete de redhat como:

Tenemos el comando `dnf repoquery --provides [package-name]` el cual nos permite saber las dependencias que el paquete en cuestión ofrece.

Tenemos el comando `dnf repoquery --requires [package-name]` eñ cual nos permite ver las dependencias que este requiere para poder funcionar correctamente.

También tenemos el comando `dnf deplist <paquete>` el cual nos devuelve detalladamente todos los paquetes los cuales este depende y sus respectivas versiones.

Tipos de dependiencias:
---

Existen diferentes tipos de dependencias los cuaels un sistema puede requerir como pueden ser:

- Required Dependencies: Estas dependencias son obligatorias, estas son necesarias para que el programa en cuestión puedan funcionar correctamente.

- Weak dependencies: Estas son opcionales, pero ayudan a mejorar la experiencia con el programa, pero no son necesarias para que este pueda funcionar correctamente. Dentro de los `weak dependencies` tenemos también distintos tipos de paquetes:

    - Recommends: Estos son recomendados por los desarrolladores siendo estos útiles para que el programa funcione de mejor manera. Para ver estos paquetes, hacemos uso del comando `dnf repoquery --recomends <paquete>`

    - Suggests: Estos son recomendaciones de dependencias del paquete en cuestión el cual hacen que mejore la experiencia con el programa. `dnf repoquery --suggests <paquete>`

Por defecto, dnf va a instalar los paquetes recomendados si estos no generan conflicto de dependencias entre los paquetes ya instalados.

En la configuración de dnf en `/etc/dnf/dnf.conf` podemos definir el parámetro `install_weak_deps=False` para que solo configure las dependencias requeridas por el paquete. Otra forma que tenemos es a la hora de instalar el paquete, usando el siguiente parámetro: `dnf install <paquete> --setopt=install_weak_deps=Fals`. El cual tiene le mismo comportamiento pero solo para la instalación en cuestión.
