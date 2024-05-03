# targets

Los targets son una forma de unir los `units` para que cumplan un objetivo. Por ejemplo: Podemos indicar y sistematizar el booteo para que ejecute una serie de programas o scripts al momento en el que se arranque un sistema.

Estos targets los definimos en un unit `.target`.

Para ver el target predeterminado del sistema, podemos usar el comando `systemctl get-status` siendo este el `target` principal del sistema. Este nos va a devolver el unit principal del sistema.

Usando el comando `systemctl cat <unit>`, podemos ver el unit y su detalle.

Para ver todos los targets podemus usar el comando `sudo systemctl list-units --type target --all`. De esta forma podremos ver el estado de todos los targets de nuestro sistema.

En resumida, los targets, son una forma de agrupar varios units y orquestar sistematicamente el arranque de ciertos units.

En ciertas distribuciones de linux tendremos targets como `graphical.target` teniendo esta todas las configuraciones necesarias para la ejecución del GNU al momento del arranque del sistema; por otra parte tendremos multi-user.target, siendo esta la configuarción predeterminada para el sistema en modo consola tty, sin cargar el GNU en el momento del arranque.

Para definir un target predeterminado del sistema usamos el comando `sudo systemctl set-default <target>`.

Para ejecutar un target, podemos usar el comando `sudo systemctl isolate <target>`
