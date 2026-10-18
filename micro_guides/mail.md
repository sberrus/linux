# Cheatsheet de `mail` en Linux (GNU Mailutils)

Chuleta práctica para enviar correos desde la consola de Ubuntu usando `mail`, con `msmtp` como servidor de envío SMTP de IONOS.

## 1. Enviar un correo básico

```
echo "Este es el cuerpo del mensaje." | mail -s "Asunto del correo" destinatario@ejemplo.com
```

- `echo`: genera el texto del mensaje.
- `|`: pasa ese texto al comando `mail`.
- `-s`: establece el asunto.
- `destinatario@ejemplo.com`: dirección del destinatario.

## 2. Enviar un correo con varias líneas

```
mail -s "Informe diario" destinatario@ejemplo.com <<'EOF'
Hola,

Este es el informe diario.
El servicio está funcionando correctamente.

Saludos,
Servidor Ubuntu
EOF
```

Utiliza un here-document (`<<'EOF'`) para escribir un mensaje multilínea directamente en el terminal o en un script.

## 3. Enviar a varios destinatarios

```
echo "Mensaje para todos." | mail -s "Aviso general" usuario1@ejemplo.com usuario2@ejemplo.com
```

Envía el mismo correo a varias direcciones.

## 4. Enviar con CC y CCO

En GNU Mailutils, `-a` añade una cabecera al mensaje. Puedes utilizarlo para `Cc` y `Bcc`.

### Con copia (CC)

```
echo "Adjunto el resumen." | mail \
  -s "Resumen del proyecto" \
  -a "Cc: responsable@ejemplo.com" \
  destinatario@ejemplo.com
```

El destinatario principal y la persona en CC pueden ver que ambos reciben el correo.

### Con copia oculta (CCO/BCC)

```
echo "Comunicado informativo." | mail \
  -s "Comunicado" \
  -a "Bcc: auditor@ejemplo.com" \
  destinatario@ejemplo.com
```

La dirección en BCC no se muestra a los demás destinatarios. Es útil para notificaciones a múltiples personas sin revelar sus direcciones.

### Con CC y CCO a la vez

```
echo "Revisa el informe adjunto." | mail \
  -s "Informe mensual" \
  -a "Cc: responsable@ejemplo.com" \
  -a "Bcc: auditor@ejemplo.com" \
  destinatario@ejemplo.com
```

Importante: `-a` en GNU Mailutils añade cabeceras; no lo confundas con `-A`, que se utiliza para adjuntar archivos.

## 5. Enviar archivos adjuntos

### Un archivo

```
echo "Te envío el informe solicitado." | mail \
  -s "Informe adjunto" \
  -A /home/usuario/informe.pdf \
  destinatario@ejemplo.com
```

`-A` adjunta el archivo al correo.

### Varios archivos

```
echo "Adjunto los documentos." | mail \
  -s "Documentación" \
  -A /tmp/informe.pdf \
  -A /tmp/datos.csv \
  -A /tmp/captura.png \
  destinatario@ejemplo.com
```

Puedes repetir `-A` para añadir más adjuntos.

### Enviar un archivo como cuerpo del mensaje

Si quieres enviar el contenido de un archivo de texto como cuerpo, en lugar de adjuntarlo:

```
mail -s "Contenido del informe" destinatario@ejemplo.com < /tmp/informe.txt
```

Esto envía el contenido de `informe.txt` como texto del mensaje.

## 6. Enviar el resultado de un comando

Muy útil para tareas de administración de servidores.

### Enviar el estado de los servicios

```
systemctl --failed | mail -s "Servicios con errores" admin@ejemplo.com
```

### Enviar el espacio en disco

```
df -h | mail -s "Uso de disco del servidor" admin@ejemplo.com
```

### Enviar la memoria disponible

```
free -h | mail -s "Estado de memoria RAM" admin@ejemplo.com
```

### Enviar el resultado de un script

```
#!/bin/bash

/usr/local/bin/mi_script.sh 2>&1 | mail -s "Resultado del script" admin@ejemplo.com
```

`2>&1` combina la salida estándar y los errores para que ambos se envíen en el correo.

Nota: en este último ejemplo, el correo se envía aunque el script termine con error. Si necesitas notificar solo cuando falla, utiliza el patrón de la sección siguiente.

## 7. Enviar un correo solo si un comando falla

```
#!/bin/bash

if ! /usr/local/bin/mi_script.sh > /tmp/mi_script.log 2>&1; then
    mail -s "ERROR: ejecución del script" admin@ejemplo.com < /tmp/mi_script.log
fi
```

- Ejecuta el script.
- Guarda la salida y los errores en un archivo.
- Si devuelve un código de error, envía el registro por correo.

Este patrón es útil para copias de seguridad, tareas programadas y comprobaciones de salud.

## 8. Enviar logs como adjunto

```
mail \
  -s "Logs del servidor" \
  -A /var/log/syslog \
  admin@ejemplo.com <<'EOF'
Se adjuntan los logs para su revisión.
EOF
```

Adjunta el archivo de log y añade un breve texto al cuerpo.

Precaución: los logs pueden contener información sensible. Revisa su contenido y permisos antes de enviarlos externamente.

## 9. Personalizar las cabeceras

### Añadir un nombre visible al destinatario

```
echo "Hola." | mail \
  -s "Prueba de correo" \
  -a 'Reply-To: soporte@ejemplo.com' \
  destinatario@ejemplo.com
```

`Reply-To` establece la dirección a la que normalmente se dirigirán las respuestas. No es lo mismo que cambiar el remitente.

### Establecer una prioridad

```
echo "Servicio detenido." | mail \
  -s "Incidencia del servidor" \
  -a "X-Priority: 1" \
  admin@ejemplo.com
```

Esta cabecera indica prioridad alta a los clientes que la reconozcan. No garantiza que el correo aparezca como urgente en todos ellos.

## 10. Enviar un correo desde un script con variables

```
#!/bin/bash

DESTINO="admin@ejemplo.com"
ASUNTO="Estado del servidor"
HOST=$(hostname)
FECHA=$(date '+%Y-%m-%d %H:%M:%S')

mail -s "$ASUNTO" "$DESTINO" <<EOF
Informe automático del servidor.

Servidor: $HOST
Fecha: $FECHA

El proceso ha finalizado correctamente.
EOF
```

Como el delimitador es `EOF` sin comillas, Bash sustituye las variables como `$HOST` y `$FECHA`.

Si no quieres que se expandan variables dentro del mensaje, usa `<<'EOF'`.

## 11. Enviar un correo con adjunto desde un script

```
#!/bin/bash

DESTINO="admin@ejemplo.com"
ASUNTO="Copia de seguridad"
ARCHIVO="/var/backups/backup.tar.gz"

if [[ -f "$ARCHIVO" ]]; then
    mail -s "$ASUNTO" \
      -A "$ARCHIVO" \
      "$DESTINO" <<'EOF'
Se adjunta la copia de seguridad.
EOF
else
    echo "No se encuentra el archivo: $ARCHIVO" >&2
    exit 1
fi
```

Comprueba que el archivo existe antes de intentar enviarlo.

## 12. Usarlo con cron

Ejemplo de entrada de `crontab` para enviar un informe de disco cada día a las 08:00:

```
0 8 * * * /bin/df -h | /usr/bin/mail -s "Informe diario de disco" admin@ejemplo.com
```

Editar las tareas programadas del usuario:

```
crontab -e
```

Comprueba las rutas reales de los binarios antes de utilizarlo:

```
command -v mail
command -v msmtp
```

Consejo: cron tiene un entorno más limitado que tu sesión interactiva. Usa rutas absolutas y asegúrate de que el usuario que ejecuta la tarea puede acceder a la configuración de `msmtp`.

## 13. Comprobar errores de envío

### Ver el código de salida

```
echo "Correo de prueba" | mail -s "Test" admin@ejemplo.com
echo $?
```

- `0`: el comando terminó sin detectar errores.
- Distinto de `0`: se produjo un error al procesar o enviar el mensaje.

Un código `0` no garantiza que el destinatario lo haya recibido en su bandeja de entrada; el servidor remoto puede aceptar el correo y este terminar después en spam.

### Probar `msmtp` directamente

```
printf 'Subject: Prueba SMTP\n\nMensaje de prueba.\n' | msmtp -v admin@ejemplo.com
```

Esto permite comprobar la conexión SMTP y ver los pasos del envío.

### Consultar el log de `msmtp`

Si configuraste el registro en `~/.msmtprc`, consulta la ruta que hayas establecido. Por ejemplo:

```
tail -n 50 ~/.config/msmtp/msmtp.log
```

Para ver nuevas entradas mientras se producen:

```
tail -f ~/.config/msmtp/msmtp.log
```

Si el registro da errores de permisos, comprueba que el archivo y su directorio pertenecen al usuario que ejecuta `mail` y `msmtp`.

## 14. Tabla rápida de referencia

| Necesidad                     | Opción o patrón                 |
| ----------------------------- | ------------------------------- |
| Definir el asunto             | `-s "Asunto"`                   |
| Adjuntar un archivo           | `-A archivo.pdf`                |
| Adjuntar varios archivos      | Repetir `-A`                    |
| Añadir CC                     | `-a "Cc: persona@ejemplo.com"`  |
| Añadir CCO/BCC                | `-a "Bcc: persona@ejemplo.com"` |
| Enviar texto multilínea       | `mail ... <<'EOF'`              |
| Enviar un archivo como cuerpo | `< archivo.txt`                 |
| Enviar salida de un comando   | `comando \\| mail ...`          |
| Ver el código de salida       | `echo $?`                       |
| Ver la ruta del comando       | `command -v mail`               |

## 15. Plantilla reutilizable recomendada

Para un correo habitual con asunto, CC, CCO y adjunto:

```
mail \
  -s "Informe semanal" \
  -a "Cc: responsable@ejemplo.com" \
  -a "Bcc: archivo@ejemplo.com" \
  -A "/tmp/informe.pdf" \
  "destinatario@ejemplo.com" <<'EOF'
Hola,

Adjunto el informe semanal para su revisión.

Saludos,
Servidor Ubuntu
EOF
```

Para los comandos anteriores, las opciones corresponden a GNU Mailutils. En otras implementaciones de `mail` o `mailx`, las opciones para adjuntos y cabeceras pueden ser diferentes.
