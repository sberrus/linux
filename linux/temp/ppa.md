# PPA

Esta es la forma que tiene ubuntu para poder compartir paquetes fácilmente con otras personas.

Mediente la siguiente url `https://launchpad.net/ubuntu/+ppas`, podemos buscar los PPAs que podemos instalar en nuestro dispositivo.

Lo que hacemos es buscar el PPA del paquete que queremos instalar. Debemos tener cuidado a la hora de elegir que paquetes vamos a instalar debido a que estos son de usuarios de la comunidad, por lo que si no confiamos de dicho usuario, mejor no instalar el PPA.

Hay forma de ver los datos del usuario que ha publicado el PPA y podemos ver estadisticas y comentarios. Si vemos que el usuario no es de fiar, mejor no instalar nada.

En las pàginas de las PPAs, podemos encontrar las instrucciones para instarlas. En terminos generales suelen ser mediante el siguiente comando:

`sudo add-apt-repository ppa:<id_ppa>`

Y para desinstalarlo y borrarlo de nuestro sistema lo hacemos mediante:

`sudo add-apt-repository --remove ppa:<id_ppa>`

Una de las cosas que debemos tener en cuenta es que a la hora de desinstalar un paquete que ha sido instalado desde un PPA, puede que tengas problemas a la hora de desinstalarlo. Si no puedes desistalarlo de la manera habitual `sudo apt remove <paquete>`, puedes hacer un `sudo apt list --installed | grep <nombre_paquete>` para luego manualmente desinstalarlo.
