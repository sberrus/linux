# bootloader

En esta sección, nos adentraremos en el sistema de boot del sistema y como este es manejado en Linux. Antes de adentrarnos tenemos que ver como funciona paso a paso el sistema de boot de un ordenador.

- El primer software que se ejecuta siempre en una máquina es la BIOS, esta se encarga de realizar ciertas tareas de bajo nivel y procede a ejecutar el resto de software que tenemos instalado. 

Es importante saber que la bios esta gestionada por la placa base por lo que no forma parte del dominio que estamos viendo que en este caso es linux.

- Luego la bios se encarga de ejecutar GRUB2 que es el primer software que los sistemas linux ejecutan cuando una máquina se enciende. Este se encarga de cargar la kernel en la memoria de la máquina. En este paso podemos indicar si inicialice linux directamente o si tenemos otros sistemas instalados podemos indicar que nos deje seleccionar el sistema con el que queremos arrancar. 
