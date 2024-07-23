# Buenas practicas al planificar jobs

Los `cronjobs` son herramientas que nos permiten planificar las tareas y poder ejecutarlas de manera programática dependiendo de las ocndiciones horarias que hayamos definido, pero esto también peude hacernos cometer errores o planificar procesos de manera incorrecta, por lo que veremos en este caso cuales son las buenas practicas que tenemos a la hora de planificar `cronjobs`.

- Planificar los horarios de ejecución de los preocesos: Dependiendo de la naturaleza de la máquina, se debe tener cuidado a la hora de definir en que momento se van a ejecutar, según, qué procesos. Por lo que la planificación para que los procesos no interfieran con otros procesos que sean prioritarios para esa máquina mejor.

- Evitar, según la naturaleza del proceso, ejecutar 2 veces el mismo proceos de manera cosnecutiva. Dependiendo el caso, se puede usar, combinado con `flock` los procesos de manera que no vayan a chocar si no se desea, principalmente con procesos que se ejecutan muy cercanos en tiempo.

- Tener configurados logs y gestión de errores: Se recomienda que se tenga un sistema de logeo y de gwstion de errores correcto porque en muchos casos, puede que el sistema no este ejecutando las tareas correctamente, por lo que si deseamos evitar que el sistema se rompa, se recomienda tener bien configurados logs y tareas para comprobar que los procesos esten ejecutando corrctamente.

- Manejar correctamente las políticas de seguridad y de manejo de permisos de los procesos: Tal cual indica, en general, como buena práctica, se recomeinda que los permisos vayan de forma ascendete intentando, según sea el caso, garantizar que los permisos sean los más básicos posibles para cada proceso garantizando que un proceso no tenga permisos innecesarios o que un proceso este siendo ejecutado por un usuario con pocos privilegios. Se recomienda tener controlado este aspecto.

- Testear los cronjobs: Parece obvio decirlo, pero es recomendable testear multiples veces el proceso antes de programarlo en un cronjob; por otro lado, se recomienda para evitar problemas en las rutas, usar rutas absolutas para que independientemente de la ubicación del proceso en el filesystem, pueda encontrar el resto de elementos de forma absoluta.

- Monitorizar la primera ejecución o las primeras para evaluar que el proceso haya sido configurado correctamente.

- Saber que implementaciones de cron debemos utilizar ya que dependiendo del sistema. Ubuntu, Debian, CentOS, Kali etc... tienen diferentes implementaciones de los cronjobs, por lo que se debe conocer correctamente en que distribuxión se esta trabajando y conocer las peculiaridades para cada uno de ellos.
