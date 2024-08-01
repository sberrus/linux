# Security in SSH connections

En esta sección veremos aspectos más relacionados con la seguridad en las conexiones mediante ssh. Si bien, uno de los aspectos más importantes para este protocolo es la seguridad, debemos tener en cuenta ciertos aspectos como los que veremos a continuación:

- Las contraseñas deben ser suficientemente largas y seguras.
- No dejar la conexión abierta sin supervisión. Siempre, al terminar de usar la terminal, cerrar la sesión y configurar el servidor para que se cierre la sesión de forma automática pasados ciertos minutos o segundos dependiendo de las políticas de seguridad que tengas implementadas.

Los aspectos mencionados anteriormente son generales. Sirven tanto para esto como para otros aspectos referentes a seguridad informatica. Por otro lado, tenemos otros aspectos que son buenos que tengamos en cuenta a la hora de configurar el servidor para escuchar conexiones mediante ssh.

## Puertos

Por defecto, los servidores ssh van configurados para funcionar en el puerto 22, pero esto lo hace vulnerable a ser atacado. Por lo que una de las recomendaciones es cambiar el puerto para ponerle más difícil al atacante poder acceder a tu servidor. Otro de los aspectos importnates a tener en cuenta en este punto es que pueden hacer un ataque de pulliting el cual lo que haría es llenar el log de auth.log y por ende, si nuestro sistema no es muy amplio en espacio, puede generar problemas de llenado de filesystem.

Para cambiar el puerto, podemos especificarlo en el fichero `/etc/ssh/sshd_config`. En este fichero, entre otras configuraciones, podemos modificar el puerto por el cual nos conectamos al servidor. **asegurate de tener los puertos abiertos**
