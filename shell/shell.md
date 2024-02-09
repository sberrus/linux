# ¿Qué es shell?

Shell es el entorno en el cual se ejecuta todo el systema.

El shell es la capa externa que tiene linux el cual ayuda a traducir los comandos que nosotros como usuarios ejecutamos, para que los entienda el kernel de linux.

También se encarga de mostrar los resultados de los comandos a los usuarios.

Si es cierto que generalmente se refiere a la shell a la consola de comandos del sistema (cli), realmente se basa en todas las interacciones externas que puedan interactuar directamente con el sistema operativo. Por lo que las GUI también son shell, los servidores web lo mismo, clientes ftp, ssh etc...

El termino linux shell se refiere comúnmente a la consola de comandos

Es una colección de configuraciones, variables ,aliases, etc... los cuales nos permiten interactuar con nuestro sistema.

Define el contexto en el cual los programas van a ejecutar.

Influencia en como los programas van a ser ejecutados. 

## Variables de entorno

Las variables de entorno se utilizan para declarar configuraciones e información globales del shell. Influyen directamente en el shell y en su comportamiento.

Por convención, las variables de entorno se declaran en mayúsculas.

Para ver todas las variables de entorno, usamos el comando `env`
