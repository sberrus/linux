### 🔍 Estado y ayuda

```bash
sudo ufw status
sudo ufw status verbose
sudo ufw status numbered
sudo ufw show added
```

### ⚙️ Activar / desactivar

```bash
sudo ufw enable
sudo ufw disable
sudo ufw reset
```

⚠️ Si estás conectado por SSH, **permite SSH antes de activar UFW**:

```bash
sudo ufw allow ssh
sudo ufw enable
```

### 🛡️ Políticas por defecto

Configuración típica:

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

También puedes bloquear las salidas:

```bash
sudo ufw default deny outgoing
```

### 🚪 Permitir puertos

```bash
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
```

Por nombre de servicio:

```bash
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
```

Rango de puertos:

```bash
sudo ufw allow 8000:8010/tcp
```

### 🚫 Denegar puertos

```bash
sudo ufw deny 23/tcp
sudo ufw deny 8080/tcp
```

Eliminar una regla:

```bash
sudo ufw delete deny 23/tcp
```

O usando el número de regla:

```bash
sudo ufw status numbered
sudo ufw delete 3
```

### 🎯 Permitir solo una IP

```bash
sudo ufw allow from 192.168.1.50
```

IP → puerto concreto:

```bash
sudo ufw allow from 192.168.1.50 to any port 22 proto tcp
```

Permitir una subred:

```bash
sudo ufw allow from 192.168.1.0/24
```

### 🌐 Permitir desde una IP hacia un puerto

```bash
sudo ufw allow from 203.0.113.10 to any port 443 proto tcp
```

Denegar:

```bash
sudo ufw deny from 203.0.113.10
```

### 📋 Ver reglas

```bash
sudo ufw status numbered
```

Ejemplo:

```text
[ 1] 22/tcp                   ALLOW IN    Anywhere
[ 2] 80/tcp                   ALLOW IN    Anywhere
[ 3] 443/tcp                  ALLOW IN    Anywhere
```

### 🧹 Eliminar reglas

```bash
sudo ufw delete allow 80/tcp
```

O:

```bash
sudo ufw delete 2
```

### 🔎 Logs

```bash
sudo ufw logging on
sudo ufw logging medium
sudo ufw logging off
```

Ver eventos:

```bash
sudo journalctl -k | grep UFW
```

En algunas instalaciones:

```bash
sudo grep UFW /var/log/ufw.log
```

### 🧰 Comandos útiles

```bash
sudo ufw app list
sudo ufw app info OpenSSH
sudo ufw reload
sudo ufw version
```

### 🏠 Ejemplo de servidor web

Una configuración sencilla:

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing

sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https

sudo ufw enable
sudo ufw status verbose
```

**Regla mental:** `allow` abre, `deny` bloquea, `delete` elimina una regla y `status numbered` te permite ver qué tienes configurado.
