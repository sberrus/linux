# Security in SSH connections

En esta sección veremos aspectos más relacionados con la seguridad en las
conexiones mediante ssh. Si bien, uno de los aspectos más importantes para este
protocolo es la seguridad, debemos tener en cuenta ciertos aspectos como los
que veremos a continuación:

- Las contraseñas deben ser suficientemente largas y seguras.
- No dejar la conexión abierta sin supervisión. Siempre, al terminar de usar la
  terminal, cerrar la sesión y configurar el servidor para que se cierre la
  sesión de forma automática pasados ciertos minutos o segundos dependiendo de
  las políticas de seguridad que tengas implementadas.

Los aspectos mencionados anteriormente son generales. Sirven tanto para esto
como para otros aspectos referentes a seguridad informatica. Por otro lado,
tenemos otros aspectos que son buenos que tengamos en cuenta a la hora de
configurar el servidor para escuchar conexiones mediante ssh.

## Puertos

Por defecto, los servidores ssh van configurados para funcionar en el puerto
22, pero esto lo hace vulnerable a ser atacado. Por lo que una de las
recomendaciones es cambiar el puerto para ponerle más difícil al atacante poder
acceder a tu servidor. Otro de los aspectos importnates a tener en cuenta en
este punto es que pueden hacer un ataque de pulliting el cual lo que haría es
llenar el log de auth.log y por ende, si nuestro sistema no es muy amplio en
espacio, puede generar problemas de llenado de filesystem.

Para cambiar el puerto, podemos especificarlo en el fichero
`/etc/ssh/sshd_config`. En este fichero, entre otras configuraciones, podemos
modificar el puerto por el cual nos conectamos al servidor. **asegurate de
tener los puertos abiertos**

Una de las cosas que debemos tener en consideración es que dependiendo de qué
sistemas estemos usando, puede que en algún punto nos bloqueen el puerto ya que
ciertos proveedores o en ciertas partes de la conexiçon con nuestro dispositivo
este bloqueando la conexión con el puerto al que deseamos acceder.

Podemos ver los intentos de acceso a las máquinas mediante el fichero
`/etc/log/auth.log` en el caso de CentOS lo encontramos en el fichero
`/etc/log/secure.log`

## Usuarios

- Deshabilitar el acceso como usuario root Otra de las configuraciones que en
  su mayoría es necesaria es la habilidad de poder logearse directamente como
  root, esto se recomienda deshabilitarlo para evitar ataques que intentan
  entrar por fuerza bruta a nustro servidor.

Para deshabilitar esta configuración, debemos declarar la directiva
`PermiteRootLogin no` en el fichero `/etc/ssh/sshd_config`.

Con esta configuración, un atacante debe conectarse al equipo como un usuario
normal y luego elevar los privilegios a administrador.

- Añadir usuarios a la `white list` de ssh. De manera predeterminada, todos los
  usuarios de la máquina pueden conectarse a la misma mediante ssh, pero se
  recomienda, para evitar problemas de seguridad, que se añadan los usuarios a
  la `white list` de manera que solo dichos usuarios puedan conectarse mediante
  ssh. Esto añade una capa extra de seguridad haciendo que los atacantes les
  cueste un poco más poder acceder a la máquina.

Esto lo hacemos añadiendo la directriz `AllowUsers <usuarios>` al fichero
`/etc/ssh/sshd_config`.

Añadido a esta recomendación, podemos definir un usuario con una política de
contraseñas estrícta y que a partir de este, podamos acceder a los usuarios que
deseemos acceder de manera más sencilla.
