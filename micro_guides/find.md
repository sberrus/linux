
# 🧭 Comando `find` en Linux

El comando `find` se usa para **buscar archivos y directorios** en una jerarquía de directorios basándose en diversas condiciones como nombre, tipo, tamaño, permisos, fecha de modificación, entre otros.

---

## 🧩 Sintaxis básica

```bash
find [ruta] [condición(es)] [acción]
```

- **[ruta]**: Directorio inicial donde comienza la búsqueda (por defecto es el directorio actual `.`).
- **[condición(es)]**: Criterios de búsqueda (por nombre, tipo, tamaño, fecha, etc.).
- **[acción]**: Qué hacer con los archivos encontrados (opcional, por defecto los imprime).

---

## 🔍 Ejemplos comunes

### 1. Buscar por nombre

```bash
find . -name "archivo.txt"          # Busca exactamente archivo.txt desde el directorio actual
find /home/usuario -iname "*.jpg"   # Busca archivos .jpg (ignorando mayúsculas/minúsculas)
```

---

### 2. Buscar por tipo

```bash
find . -type f     # Busca archivos normales
find . -type d     # Busca directorios
find . -type l     # Busca enlaces simbólicos
```

---

### 3. Buscar por tamaño

```bash
find . -size +100M   # Archivos mayores a 100 MB
find . -size -1k     # Archivos menores a 1 KB
find . -size 10M     # Archivos exactamente de 10 MB
```

---

### 4. Buscar por permisos

```bash
find . -perm 644      # Archivos con permisos exactos 644
find . -perm -111     # Archivos con al menos permisos de ejecución para todos
find . -perm /222     # Archivos con permisos de escritura para alguien (usuario, grupo o resto)
```

---

### 5. Buscar por fecha

```bash
find . -mtime -7      # Archivos modificados en los últimos 7 días
find . -mtime +30     # Archivos modificados hace más de 30 días
find . -atime +10     # Archivos no accedidos en los últimos 10 días
```

---

### 6. Ejecutar comandos con `-exec`

```bash
find . -name "*.log" -exec rm {} \;            # Elimina todos los archivos .log encontrados
find . -type f -exec chmod 644 {} \;           # Cambia permisos de todos los archivos a 644
find . -name "*.sh" -exec chmod +x {} \;       # Da permisos de ejecución a todos los .sh
```

---

### 7. Buscar y usar `xargs` (más eficiente que `-exec` en muchos casos)

```bash
find . -name "*.txt" | xargs grep "buscar_esto"      # Busca la cadena "buscar_esto" en todos los .txt
find . -type f -name "*.bak" | xargs rm              # Elimina todos los archivos .bak encontrados
```

---

### 8. Buscar archivos vacíos

```bash
find . -type f -empty     # Archivos vacíos
find . -type d -empty     # Directorios vacíos
```

---

### 9. Buscar múltiples condiciones

```bash
find . \( -name "*.log" -o -name "*.tmp" \)          # Archivos que sean .log o .tmp
find . -type f -name "*.conf" -mtime -30             # Archivos .conf modificados en los últimos 30 días
```

---

## 🧠 Tips útiles

- Usa `-print` si quieres asegurarte de que los resultados se muestren (aunque suele ser implícito).
- Usa comillas dobles `"*.ext"` para evitar expansión de comodines por el shell.
- Usa `\;` al final de `-exec` y **escápalo** correctamente.
- Para búsquedas muy grandes, `xargs` puede acelerar bastante la ejecución.

---

¿Quieres que incluya ejemplos con `find` + `grep`, o con expresiones regulares?
