# Los ficheros de configuración

Los ficheros de configuración son ficheros especiales que el sistema a la hora de iniciarse una nueva shell los lee para definir configuraciones y declarar ciertos parámetros como pueden ser, definir una variable PATH personalizada, modificar ciertas variables de entorno, declarar nuevas variables de entorno, etc...

En este segmento veremos como podemos declarar y almacenar ciertas configuraciones para que el sistema los utilice para cuando se inicialice una nueva cnsola.

## Tipos de inicialización de shells

Hay diferentes tipos de shells los cuales dependiendo del caso, utilizaran o no algún archivo que automáticamente ejecutará al momento de incializarce.

- Shell interactiva con loggeo

Estos son los shell que al momento de inicializarlas nos solicitan que ingresemos el usuario como la contraseña para poder acceder a la shell. Por ejemplo tenemos tty o ssh.

En el caso de las consolas interactivas con loggeo, el orden de carga de los ficheros será el siguiente:

/etc/profile -> Primero se carga este archivo. Este archivo es leído desde todas las consolas de primero.

Luego busca en los siguientes siguiendo este orden, siendo el primer archivo que se encuentre el que va a ser configurado, omitiendo los demás. Por lo que si el archivo .bash_profile existe, lo que hayamos definido en .profile nunca va a ser leído:
	~/.bash_profile
	~/.bash_login
	~/.profile -> En el caso de ubuntu, se suele deefinir todo en este archivo.

- Shell interactiva sin loggeo

Estas son las shells que directamente se ejecutan sin solicitarnos que ingresemos las credenciales de acceso nuevamente. Estas podrían ser, nuevas ventanas de shells, terminales de tmux, ejecutar el comando bash o zsh, etc... A la hora de crear una nueva isntancia, no nos solicita que ingresemos las credenciales para acceder al sistema.

En este caso el primer archivo que se va a leer es .bashrc

- Shell no interactiva y sin loggeo

Estas son las shell que no podemos interactuar con ellas ni debemos logearnos, estas pueden ser scripts de shell por ejemplo.

En este caso va a buscar la ruta que se encuentre en la variable de entorno BASH_ENV

- shell no interactiva con loggeo 

Estas shell's podrían ser, la ejecución de un script remoto en otro servidor. Este no podremos interactuar con el, pero debemos logearnos para poder ejecutarlo.


