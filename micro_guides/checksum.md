# Checksum
Los checksums es útil para que se pueda garantizar que un binario pertenece realmente a su creador.

Esto se basa en un checksum, que tiene, dependiendo del algoritmo usado para crearlo de las siguientes caracteristicas:

- Un hash MD5 tiene 32 caracteres hexadecimales.
- SHA1 tiene 40.
- SHA256 tiene 64.

Esto se realiza ejecutando los binarios `<algoritmo>sum binario`, ej: sha256sum patata. Esto devuelve un hash que luego puedes usar para que otras personas puedan comprobar que el binario utilizado coincide realmente con su checksum.

```bash
# Para MD5
md5sum binario

# Para SHA1
sha1sum binario

# Para SHA256
sha256sum binario
```

Para resumir y facilitar, entiendase el checksum como un algoritmo que coge del binario datos para calcular el checksum, a partir de este cehcksum, otros usuarios pueden usar el checksum generado para validar si el binario es realmente el que ha subido el desarrollador.

Esto es útil para detectar si un binario ha sido modificado de la versión que ha montado el desarrollador para su fuente de confianza.

El desarrollador genera el binario y el checksum y los montan juntos. Los usuarios que vayan a instalar el binario, deben primero coger el checksum que monta el desarrollador y hacer la comparación con el binario para saber si realmente el binario es el original.

## Verificar binario con hash checksum
Para realizar la validación, hacemos lo siguiente:

1. Creamos un checksum con el mismo algoritmo usado por el desarrollador ej: `sha256sum <binario>` esto devuelve un hash.
2. Cogemos el hash desde la fuente de confianza (el que monta el desarrollador) y comparamos ambos.

En el caso de que sean identicos, significa que el binario no ha sido modificado, por lo que es lo mismo que ha desarrollador el desarrollador. Si no coinciden, no lo instales ya que el binario que uso el desarrollador para hacer el checksum no coincide con el binario que tienes descargado.
