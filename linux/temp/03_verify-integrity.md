# Verificar integridad de los paquetes

Hay ciertas maneras que tenemos para verificar la integridad de los pquetes que instalamos en ubuntu. Esto es útil para conceptos de ciberseguridad.

Para comprobar la integridad de un fichero podemos hacer uso del programa `debsums` el cual nos permite realizar una inspección de los ficheros del sistema el cual nos indica si tenemos programas que no tienen el debsum configurado correctamente.

Este debsum es una firma que tienen los ficheros con md5 el cual nos permite identificar la integridad de los ficheros dentro del sistema y en caso necesario coger y listar aquellos que tengan problemas.

tenemos flags que hacen lo siguiente:

- `debsums -l`: lista los ficheros que no cuentan con la firma.
- `debsums -a`: lista todos los archivos del sistema incluyendo los ficheros de configuración.
- `debsums -s`: solo lista los ficheros que tengan problemas.

Cabe destacar que el prorgama solo comprueba los ficheros que se obtienen de paquetes instalados. En el caso de que por algún motivo se haya creado algún fichero manualmente, debsums no los capta.

Se recomienda que si quieres revisar un paquete en especifico, también se recomienda revisar el resto de paquetes adicionales con los que se instala.
