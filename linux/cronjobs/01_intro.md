# CRONJOBS

Los cronjobs son una forma que tiene linux de programar sistemáticamente procesos para que estos se ejecuten automáticamente dependiendo de la configuración que le hayas pasado.

En esta sección veremos como configurarlo, programar ejecuciones, como funciona el sistema de tiempos entre otras cosas.

## cronjobs vs systemd, timer, etc...

Si es cierto que podemos realizar estas tareas con otros programas, la diferencia que tiene cronjob con respecto a sus alternativas, es la de que esta es más portable y sistemas como UNIX la tienen incluida en el mismo. Por lo que los sistemas que no cuenten con systemd, si van a tener acceso a cronjob.

Esta caracteristica viene integrada en varios paquetes y no tiene un claro reemplazo a corto plazo, por lo que sigue siendo relevante.

## Implementaciones más frecentes

Dependiendo del sistema, podemos encontrarnos con implementaciones de la caracteristica cron ligeramente diferentes dependiendo de los mismos. A continuación, veremos algunos ejemplos de esto:

- vixie-cron: Es la implementación de ubuntu de esta caracteristica.
- anacron: Es una implementación para ubuntu que permite ejecutar procesos en intervalos regulares de manera sencilla. La principal diferencia es que en el caso de que se reinicie el sistema, este se mantiene persistente y ejecuta en la siguiente vuelta valida.
- cronie: es la implementación de cron en CentOS, este es un fork de vixie-cron, con la diferencia de que ya anacron se encuentra integrado en el mismo paquete.
