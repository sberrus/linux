# Security in SSH connections

En esta sección veremos aspectos más relacionados con la seguridad en las conexiones mediante ssh. Si bien, uno de los aspectos más importantes para este protocolo es la seguridad, debemos tener en cuenta ciertos aspectos como los que veremos a continuación:

- Las contraseñas deben ser suficientemente largas y seguras.
- No dejar la conexión abierta sin supervisión. Siempre, al terminar de usar la terminal, cerrar la sesión y configurar el servidor para que se cierre la sesión de forma automática pasados ciertos minutos o segundos dependiendo de las políticas de seguridad que tengas implementadas.

Los aspectos mencionados anteriormente son generales. Sirven tanto para esto como para otros aspectos referentes a seguridad informatica. Por otro lado, tenemos otros aspectos que son buenos que tengamos en cuenta a la hora de configurar el servidor para escuchar conexiones mediante ssh.

## Puertos

Por defecto, los servidores ssh van configurados para funcionar en el puerto 22, pero esto lo hace vulnerable a ser atacado. Por lo que una de las recomendaciones es cambiar el puerto para ponerle más difícil al atacante poder acceder a tu servidor. Otro de los aspectos importnates a tener en cuenta en este punto es que pueden hacer un ataque de pulliting el cual lo que haría es llenar el log de auth.log y por ende, si nuestro sistema no es muy amplio en espacio, puede generar problemas de llenado de filesystem.

Para cambiar el puerto, podemos especificarlo en el fichero `/etc/ssh/sshd_config`. En este fichero, entre otras configuraciones, podemos modificar el puerto por el cual nos conectamos al servidor. **asegurate de tener los puertos abiertos**

Una de las cosas que debemos tener en consideración es que dependiendo de qué sistemas estemos usando, puede que en algún punto nos bloqueen el puerto ya que ciertos proveedores o en ciertas partes de la conexiçon con nuestro dispositivo este bloqueando la conexión con el puerto al que deseamos acceder.

Podemos ver los intentos de acceso a las máquinas mediante el fichero `/etc/log/auth.log` en el caso de CentOS lo encontramos en el fichero `/etc/log/secure.log`

## Usuarios

- Deshabilitar el acceso como usuario root
Otra de las configuraciones que en su mayoría es necesaria es la habilidad de poder logearse directamente como root, esto se recomienda deshabilitarlo para evitar ataques que intentan entrar por fuerza bruta a nustro servidor.

Para deshabilitar esta configuración, debemos declarar la directiva `PermiteROotLogin no` en el fichero `/etc/ssh/sshd_config`.

Con esta configuración, un atacante debe conectarse al equipo como un usuario normal y luego elevar los privilegios a administrador.

- Añadir usuarios a la `white list` de ssh.
De manera predeterminada, todos los usuarios de la máquina pueden conectarse a la misma mediante ssh, pero se recomienda, para evitar problemas de seguridad, que se añadan los usuarios a la `white list` de manera que solo dichos usuarios puedan conectarse mediante ssh. Esto añade una capa extra de seguridad haciendo que los atacantes les cueste un poco más poder acceder a la máquina.

Esto lo hacemos añadiendo la directriz `AllowUsers <usuarios>` al fichero `/etc/ssh/sshd_config`.

Añadido a esta recomendación, podemos definir un usuario con una política de contraseñas estrícta y que a partir de este, podamos acceder a los usuarios que deseemos acceder de manera más sencilla añadiendo una capa extra de seguridad al sistema.

## Errores al cambiar la configuración de ssh

Una de las cosas que debemos tener en cuenta a la hora de modificar la configuración de ssh es que los cambios que hagamos, de hacerlo mal, podemos bloquearnos o podemos romper la configuración de ssh haciendo que sea inaccesible acceder al servidor mediante esta vía. En el caso de servidores virtuales o en entornos cloud, esto puede ser un problema porque podemos dejar inaccesible o en el caso de servidores físicos, debemos acceder físicamente a estos para poder revertir los cambios que se han hecho. 

Para minimizar este riesgo podemos hacer lo siguiente:

- Luego de realizar los cambios, podemos intentar acceder al servidor desde otra consola. La consola antigusa seguira viva, la configuración de ssh se hace al momento de hacer el intento de acceso para las nuevas consolas que lo soliciten. Por lo que es una buena recomendación el realizar una prueba de conexión antes de matar la consola que se encuentra conectada en ese momento.

- Usar el comando `sudo sshd -t` para testear que el fichero de configuración de ssh se encuentra configurado correctamente. 

## Fingerprint

Uno de los aspectos de ciberseguridad más importantes que debemos tener en cuenta es el tema de las fingreprints. Cada vez que accedemos por primera vez a un servidor desde un cliente, este generará un fingerprint una única vez y cada sistema tiene sus propios fingerprints de los servidores con los que ha hecho conexión.

**importante**
- Si hacemos una conexión con un servidor y volvemos a reconectarnos y nos vuelve a pedir que almacenemos un finerprint, **NO LO IGNORES** ya que significa que el cliente esta detectando que ha habido un cambio o en el hostname o en la dirección del servidor; por lo cual debemos tener cuidado porque podemos estar siendo victimas de un ataque (Man-in-the-Middle) y las credenciales del servidor pueden estar corriendo poligro.

Los fingerprints suelen ser bastante seguros lo cual si estas intentando conectarte a una red que ya había generado un fingerprint anteriormente, pues no debería pedirte la query de nuevo. Al estar en un Man in the Middle, va a solicitarse un nuevo figerprint ya que al intentar conectarse a la máquina maliciosa, se va a intentar crear un fingerprint entre el cliente ssh y la máquina maliciosa que hace el forwarding a la máquina a la cual deseas realmente conectarte.

En el caso de que tengamos alguna sospecha, lo que podemos hacer es comprobar el fichero `~/.ssh/known_hosts` para comprobar que el hostname y las direcciones corresponden a las del servidor que queremos acceder, si vemos que hay algo que no cuadra, hay que hacer una inspección del sistema para evitar estar en presencia de un Man-In-The-Middle.

### ¿Cómo podemos comprobar el fingerprint?

Una de las formas que tenemos para comprobar, en el caso de que tengamos acceso a la máquina a la cual queremos acceder, podemos usar el siguiente comando `ssh-keygen -E <algoritmo_hasheo> -lf <ruta de fichero semilla en máquina>`. Con este comando, vemos el fingerprint que va a entregarle al cliente que se desea autenticar. Lo que debemos hacer es coger el fingerprint que el cliente esta mostrando para almacenar como confiable y compararlo con el fingerprint que devuelve la máquina a la cual nos queremos conectar. Si ambos fingerprints son iguales, podemos proceder a conectarnos a la máquina.

Una de las cosas que debemos tener en cuenta es el fichero que le pasamos al comando para que nos muestre el fingerprint. Dependiendo, en el fingerprint nos va a pedir un tipo de fichero que contiene `ssh_host_<ecdsa|ed25519|rsa>_key`; dependiendo de cuando vayas a conectarte, peude que te solicite uno de esos valores (ecdsa|ed25519|rsa) con su respectivo algoritmo. El cual deberemos utilizar correctamente para saber cual de las semillas es la que genera el fingerprint correcto.

```
ECDSA key fingerprint is SHA256:<FINGERPRINT>.
^^^^^ -> algoritmo       ^^^^^^
                         ^^^^^^ -> algoritmo
```

En este caso, el comando sería el siguiente: `ssh-keygen -E SHA256 -lf /etc/ssh/ssh_host_ecdsa_key`

Como podemos ver, en el cliente de ssh, esta solicitando el fingerprint correspondiente a la key ecdsa usando el algoritmo sha256.
