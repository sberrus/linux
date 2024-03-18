# Buffer

Para resumir, el termino buffer se refiere a una forma que tienen los sistemas modernos de almacenar datos de foma dínamica. Son útiles para mejorar la eficiencia de ciertos procesos de lectura-escritura y ayuda al sistema a gestionar los datos de manera más eficiente.

Dependiendo del tipo de proceso el buffer puede encontrarse en la RAM, discos, memorias cachè del CPU etc... Depende principalmente del proceso en sí y de como los softwares necesitan almacenar estos buffers.

## Unbuffered I/O

Estos manejan directamente la información desde el dispositivo I/O y el programa. Estos suelen ser realmente útiles para procesos en los que premian la velocidad en la cual recibimos información como puede ser el teclado, sensores de todo tipo etc...

## Buffered I/O

Por otro lado, buffered se refiere a los datos que se almacenan en el buffer según el sistema, antes de ser enviado al respectivo dispositivo I/O. Suele ser útil para leer grandes cantidades de datos y prima la integridad de los datos.
