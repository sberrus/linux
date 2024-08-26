# Simple File Transfer Protocol (SFTP)

Es una caracteristica de ssh que nos permite tener un canal que permite transferir ficheros entre máquinas a traves del protocolo ssh.

En linux, tenemos 2 formas de interactuar con este protocolo:

    - Interfaz gráfica: Piezas de software que mediante una interfaz gráfica que permite la transferencia de ficheros.
    - Program scp: a traves de CLI, podemos pasar ficheros de una máquina a otra usando el programa scp.
    - Interfaces gráficas para clientes Windows/MAC: existen alternativas para esto pero se recomienda un programa llamado cyberduck el cual ofrece una interfaz web por la cual podemos transferir ficheros directamente a nuestro host. 


## Acceder a sistema de ficheros a traves de sftp

Ubuntu
---
En el caso de los sistemas Ubuntu, en el explorador de ficheros, tenemos la opción de 'other locations' el cual nos permite conectarnos a servidores sftp. 

En este debemos indicar el protocolo que vamos a utilizar y el usuario para acceder como si fuera ssh. EJ: `sftp://<usuario>@<hostname>`

scp (Secure File Copy OpenSSH)
---
En el caso de querer usar la consola, debemos hacer uso del comando scp el cual nos permite, mediante el protocolo ssh hacer transferencia de ficheros a traves de este protocolo. Para hacerlo debemos hacer lo siguiente:

`scp <usuario>@<hostname>:<ruta_en_máquina_de_fichero_a_copiar> <ruta_en_local_de_fichero_a_copiar>`


