# Sistema de jerarquía de ficheros.

Como bien hemos visto en la carpeta raíz tenemos una cantidad de directorios los cuales tienen una funcionalidad los cuales detallaremos enseguida.

- /bin -> Este directorio se encarga de contener los programas necesarios que necesita el sistema para poder funcionar. Este directorio siempre debe estar disponible para el correcto funcionamiento del sistema. Se basan en archivos binarios necesarios para el sistema. Esta carpeta es necesaria para poder reparar el sistema en caso de que algo falle.

- /sbin -> parecido a bin, con la diferencia de que estos son principalmente accedidos por el usuario root.

- /usr/bin -> Son binarios que pueden ser accedidos globalmente por todos los usuarios. La necesidad de esta ruta era que antiguamente o en sistemas con recursos limitados, esta ruta solía apuntar a otro disco el cual contenia los binarios no escenciales para el sistema, por lo que las carpetas /bin y /sbin, apuntaban al disco principal priorizando la criticidad del sistema y el resto de binarios en otro disco externo. Actualmente se sigue usando la ruta /usr/bin para alojar los binarios no esenciales y tener más ordenados el resto de binarios del sistema.

usr/bin también suele ser un disco virtual el cual, de ser necesario, puede ser accedido por varias máquinas dentro de una red.

- /usr/sbin -> Esta carpeta es de binarios importantes pero no esenciales para el sistema.

- /usr/local/bin | /usr/local/sbin -> Siguiendo la misma lógica de /usr/bin y /usr/sbin, pero con la diferencia de que son principalmente pensados para ser accedidos por la máquina anfitriona, por lo que no estan pensados para ser compartidos con otras máquinas dentro de la red.
