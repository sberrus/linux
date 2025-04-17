
# 📦 Comando `tar` en Linux

El comando `tar` se utiliza para **empaquetar** (y opcionalmente **comprimir**) archivos y directorios en un solo archivo. Es muy común en sistemas Unix/Linux para backups y distribución de software.

---

## 🧩 Sintaxis básica

```bash
tar [opciones] archivo.tar [archivos o directorios]
```

---

## 🎯 Opciones más comunes

- `-c` → crear un nuevo archivo tar
- `-x` → extraer archivos de un archivo tar
- `-t` → listar contenido sin extraer
- `-v` → modo detallado (verbose)
- `-f` → usar un archivo como entrada o salida
- `-z` → usar compresión gzip (`.tar.gz`)
- `-j` → usar compresión bzip2 (`.tar.bz2`)
- `-J` → usar compresión xz (`.tar.xz`)

---

## 🛠️ Ejemplos comunes

### 1. Crear un archivo `.tar`

```bash
tar -cvf archivo.tar carpeta/               # Crea archivo.tar con el contenido de "carpeta"
```

---

### 2. Crear un archivo comprimido `.tar.gz`

```bash
tar -czvf archivo.tar.gz carpeta/           # Crea un archivo comprimido con gzip
```

---

### 3. Crear un archivo comprimido `.tar.bz2`

```bash
tar -cjvf archivo.tar.bz2 carpeta/          # Usa bzip2 para mayor compresión
```

---

### 4. Extraer un archivo `.tar`

```bash
tar -xvf archivo.tar                        # Extrae los archivos del tar actual
```

---

### 5. Extraer un archivo `.tar.gz` o `.tgz`

```bash
tar -xzvf archivo.tar.gz                    # Extrae un archivo comprimido con gzip
```

---

### 6. Extraer un archivo `.tar.bz2`

```bash
tar -xjvf archivo.tar.bz2                   # Extrae archivo comprimido con bzip2
```

---

### 7. Extraer en un directorio específico

```bash
tar -xvf archivo.tar -C /ruta/destino/      # Extrae el contenido en una carpeta específica
```

---

### 8. Listar el contenido de un archivo tar

```bash
tar -tvf archivo.tar                        # Muestra la lista de archivos sin extraerlos
```

---

### 9. Añadir archivos a un `.tar` existente (sin compresión)

```bash
tar -rvf archivo.tar nuevo_archivo.txt      # Agrega nuevo_archivo.txt a archivo.tar
```

---

### 10. Extraer un solo archivo de un `.tar`

```bash
tar -xvf archivo.tar ruta/dentro_del_tar.txt     # Extrae un solo archivo
```

---

## 🧠 Tips útiles

- Los archivos `.tar.gz` también pueden llamarse `.tgz`.
- Usa `-C` para cambiar de directorio antes de empaquetar o extraer.
- `tar` no puede añadir archivos a `.tar.gz` directamente (debe estar sin compresión).
- Puedes combinar `tar` con `find` o `xargs` para crear archivos más personalizados.

---

¿Te gustaría ver cómo automatizar backups o combinar `tar` con cron?
