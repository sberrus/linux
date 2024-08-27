# Package Manager RHEL
En esta sección se verán las recomendaciones para gestionar paquetes en sistemas Red Hat.

Los paquetes en redhat son .rpm

La página donde se encuentran todos los paquetes oficiales de redhat es `http://mirror.centos.org/`. En este sitio podemos encontrarnos con una interfaz parecida a un navegador de directorios en los cualesp odemos ver los distintos paquetes que estan registrados en REDHAT.

En esta distro, tenemos el comando `rpm` que nos ayuda a gestionar los paquetes .rpm y visualizar tanto sus ficheros internos y otras funcionalidades útiles para la gestión de paquetes en RedHat.

Para instalar un paquete .rpm hacemos uso del comando con las siguientes configuraciones `sudo rpm -i <ruta_al_binario>`. Para esto debemos tener privilegios de administrador para poder instalar los ficheros.
