# mapping dns in local

En linux podemos mapear dominios manualmente de forma sencilla modificando el fichero `/etc/hosts`. Este fichero nos permite mapear dominios de manera sencilla de manera que podamos utilizar dichos dominios que son más fáciles de recordar que las ip's.

La sintaxis es sencilla:

``` Ejemplo de entrada en /etc/hosts
# [ip] [host]
127.0.0.1 localhost
```

Es realmente útil para cuando tenemos que gestionar múltiples dispositivos e ips para tenerlas más ordenadas.

Hay veces en la que estos cambios no se ven reflejados automaticamente, para que esto funcione, debemos hacerle un flush al dns para que refresque los dns.

En el caso de Linux hay dos sistemas que nos permiten manejar esto que pueden ser `systemd-resolved` o `dnsmasq`.

Para saber esto hacemos uso del comando `lsof -i :53` siendo :53 el puerto predeterminado de los servidores dns.

Dependiendo de que gestor se este usando se ejecutarán los siguientes comandos:

- systemd-resolve: `resolvectl flush-caches`.
Otros comandos interesnates podrían ser `resolvectl status` y `resolvetl statistics`

- dnsmaq: En el caso de dnsmap, solo basta con reinicar el servicio. `systemctl restart dnsmaq`.
