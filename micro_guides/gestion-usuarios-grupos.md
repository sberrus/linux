Aquí tienes los **comandos en Red Hat / RHEL (y derivados como CentOS, Rocky, Alma)** para cada caso, con una breve explicación.

***

## 1️⃣ Añadir **usuario de sistema**, **sin home** y **no logeable**

```bash
useradd -r -M -s /sbin/nologin usuario_servicio
```

**Qué hace cada opción:**

*   `-r` → usuario de sistema (UID < 1000)
*   `-M` → no crea directorio *home*
*   `-s /sbin/nologin` → impide que el usuario pueda iniciar sesión

🔒 *(Opcional, recomendable)* Bloquear explícitamente la contraseña:

```bash
passwd -l usuario_servicio
```

***

## 2️⃣ Crear **nuevo grupo** para un servicio

```bash
groupadd grupo_servicio
```

Si quieres que sea un **grupo de sistema** (coherente con usuarios de servicio):

```bash
groupadd -r grupo_servicio
```

***

## 3️⃣ Añadir **grupo de servicio** a **usuario de servicio**

```bash
usermod -aG grupo_servicio usuario_servicio
```

**Importante:**

*   `-a` → añade el grupo (sin eliminar los existentes)
*   `-G` → grupos secundarios

***

## ✅ Comprobaciones útiles

Ver usuario:

```bash
id usuario_servicio
```

Ver grupo:

```bash
getent group grupo_servicio
```

Ver shell asignada:

```bash
getent passwd usuario_servicio
```

***

Si quieres, dime:

*   si el usuario debe tener **grupo primario propio**
*   si el servicio necesita **acceso a un directorio concreto**
*   o si lo estás preparando para **systemd / SELinux**

y te doy el ajuste exacto 😉
