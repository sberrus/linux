# Cheatsheet for linux

## User management
- useradd: Create a new user in the system without configuration:
	-m: define le directorio /home/ del usuario.
	-d: define una ruta personalizada para el directorio /home/* del usuario.
	-s: define una shell que no sea la predeterminada.
	-g: define el grupo principal del usuario.
	-G: define grupos personalizados para el usuario.
- passwd: handles users passwords.
	-S: show user password data.
	-S: Muestra el estado de la contraseña del usuario.
	-d: Elimina la contraseña del usuario.
	-n: Configura el mínimo de edad de refresco de la contraseña (en dias). Indica cuanto tiempo debe esperar el usuario para poder renovar la contraseña.
	-x: Configura el máximo de edad de la contraseña (en dias). Indica cada cuanto tiempo debe cambiar la contraseña el usuario.
	-l: bloquea al usuario.
	-u: desbloquea al usuario.	
- usermod: Modificamos los datos y caracteristicas de los usuarios de la máquina.
- groupmod: change group information and data.
- visudo: grant user root access.
- sudo: give current user root access temporaly.

## files and directories
- touch: create an empty file.
- mkdir: create a directory.


## process handling
- ps: show process of the current user.
	-a: show all processes of all users.
	-e: show processes of all users and all sesions.
	-f: show processes with extended info
- pgrep <process_name>: show the id of a given process.
- nice: run a process with a given niceness.
- renice: change a running process niceness.
- 
