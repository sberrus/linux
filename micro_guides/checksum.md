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


## Fichero estandar de checksums
Hay veces en las que los desarroladores generan varios checksums para distintas versiones de sus programas dependiendo de la arquitectura que se haya usado para compilar el binario. Por ejemplo, en el siguiente ejemplo se puede ver el checksum para process_exporter en su version 0.8.7

```
e21edfde1392716c28f7dc6ea76e8a21553891754bc7558ff2a3d4efa4b48920  process-exporter-0.8.7.linux-386.tar.gz
6d274cca5e94c6a25e55ec05762a472561859ce0a05b984aaedb67dd857ceee2  process-exporter-0.8.7.linux-amd64.tar.gz
4a2502f290323e57eeeb070fc10e64047ad0cd838ae5a1b347868f75667b5ab0  process-exporter-0.8.7.linux-arm64.tar.gz
5f1b9eb823af9029e5c1c4755997fa5f9b555b05b562512bfe11f054a7ccd683  process-exporter-0.8.7.linux-armv6.tar.gz
89e4ffe2976a46609e28681f514afd1120b89cccbeee3ca38da406482c7d187d  process-exporter-0.8.7.linux-armv7.tar.gz
6b025b11bc74159fca77c40bea95ed505a8c7247c6b47bfcb1694754e3b81180  process-exporter-0.8.7.linux-ppc64.tar.gz
202e9db60087d69f26eaaed22b2afc9a35b05fc64b177752d51c4fba894fc8d1  process-exporter-0.8.7.linux-ppc64le.tar.gz
815b77f942455b48ab2800ceed1b468338b9cbf524e3b57ceb8ab1d004221a64  process-exporter_0.8.7_linux_386.deb
84d325a80feb1f192507935a5c4f22a8f43e05eda4f66ff66d9dc0a1646ee674  process-exporter_0.8.7_linux_386.rpm
b36fb19a7f881ff333bd8c930507fd196559ef83119f58a81cd1b3dd88fe88de  process-exporter_0.8.7_linux_amd64.deb
6596990d559fb39edfa02c7c3b5346b80fb468a1f4f065c1dd2c3639bbf93ebf  process-exporter_0.8.7_linux_amd64.rpm
e4205a2df82ea1d4626d37f053abb6c4e96d417a16f7d71a96ff2d7b9a1e7d5e  process-exporter_0.8.7_linux_arm64.deb
0cf0b53a183fd54fc9c95628cc13a456d3a202068587dbd003c7260c7660ea6a  process-exporter_0.8.7_linux_arm64.rpm
99a36454a6319d7a3ebbdff3f8c0b393d9aff2b35db96776725419d5c9305760  process-exporter_0.8.7_linux_armv6.deb
e9b0cc2d592a269a7c05e3f9056612fe609ddf5f40cec9f3827e4f0e72cf7f83  process-exporter_0.8.7_linux_armv6.rpm
e74df50a5e07375fb4f3c77aee3793e3662a74373e0128fb225a11dc523a12b9  process-exporter_0.8.7_linux_armv7.deb
8bd4ee7a2d1ad0ec0fe362fd2cc4d4674f18886d9c42c0ca78c180edbf92cf7d  process-exporter_0.8.7_linux_armv7.rpm
da65d87ac411596936c92689d22bb3da4c85eb7e79b0ea7a2332205968371f0e  process-exporter_0.8.7_linux_ppc64.deb
816df89f13bca2c630efb70e9c30c815ac8d551c343a96210f3989e49b0c43ab  process-exporter_0.8.7_linux_ppc64.rpm
db189c574d1ece66fc88726e7c11b71416d4bc555607ab36a852b9b715a7f2df  process-exporter_0.8.7_linux_ppc64le.deb
43475e567606260aac697f3a96fd3a5c9819cc8a87f8bbedcc9bbe50a3c2f8ea  process-exporter_0.8.7_linux_ppc64le.rpm
```

Como se puede ver se componen de <HASH> binario. Haciendo uso del respectivo algoritmo, podemos comprobarlos todos siempre que el binario se encuentre en la misma ruta con el uso del flag `-c` ej: `sha256sum -c checksums.txt`. Lo que hace este comando es que evalua en la misma ruta donde se ejecuta si los checksums coincide alguno con los binarios que encuentre en la ruta.

En el caso de que se encuentre se vé un mensaje como `process-exporter-0.8.7.linux-amd64.tar.gz: OK` indicando que el checksum es correcto.