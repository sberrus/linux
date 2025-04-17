
# 🧮 Comando `awk` en Linux

`awk` es un potente lenguaje de procesamiento de texto que se utiliza principalmente para **analizar, filtrar y formatear archivos de texto estructurados** (como logs, CSVs o salidas de otros comandos).

---

## 🧩 Sintaxis básica

```bash
awk 'patrón { acción }' archivo
```

- **patrón**: condición que debe cumplirse para ejecutar la acción.
- **acción**: operación que se realiza cuando se cumple el patrón (puede ser imprimir, sumar, filtrar, etc.).

---

## 🔍 Variables especiales de `awk`

- `$0` → línea completa
- `$1`, `$2`, ..., `$n` → columnas (campos) individuales
- `NF` → número de campos en la línea
- `NR` → número de línea actual
- `FS` → separador de campos (Field Separator)

---

## 🛠️ Ejemplos comunes

### 1. Imprimir columnas específicas

```bash
awk '{ print $1 }' archivo.txt             # Imprime solo la primera columna
awk '{ print $1, $3 }' archivo.txt         # Imprime la primera y tercera columna
```

---

### 2. Usar un separador de campos personalizado

```bash
awk -F: '{ print $1 }' /etc/passwd         # Imprime el nombre de usuario (campo 1) del archivo /etc/passwd usando ":" como separador
```

---

### 3. Filtrar líneas según condiciones

```bash
awk '$3 > 1000' archivo.txt                # Imprime las líneas donde la tercera columna es mayor que 1000
awk '$1 == "ERROR"' archivo.log            # Imprime las líneas donde la primera columna es "ERROR"
```

---

### 4. Sumar valores de una columna

```bash
awk '{ suma += $2 } END { print suma }' archivo.txt     # Suma los valores de la segunda columna
```

---

### 5. Contar líneas que cumplen una condición

```bash
awk '$3 > 100 { count++ } END { print count }' archivo.txt   # Cuenta cuántas líneas tienen un valor mayor a 100 en la tercera columna
```

---

### 6. Formatear la salida

```bash
awk '{ printf "Nombre: %s | Edad: %s\n", $1, $2 }' archivo.txt     # Formatea la salida con printf
```

---

### 7. Usar expresiones regulares

```bash
awk '/error/' archivo.log                      # Imprime líneas que contienen la palabra "error"
awk '!/OK/' archivo.log                        # Imprime líneas que NO contienen la palabra "OK"
```

---

### 8. Ejecutar código antes o después del procesamiento

```bash
awk 'BEGIN { print "Inicio" } { print $1 } END { print "Fin" }' archivo.txt
# Muestra "Inicio" antes de procesar, luego la primera columna de cada línea, y "Fin" al final
```

---

## 🧠 Tips útiles

- Puedes combinar `awk` con otros comandos en pipelines:  
  ```bash
  ps aux | awk '$3 > 50 { print $1, $3 }'   # Muestra procesos con más de 50% de CPU
  ```

- Usa `-F` para definir separadores personalizados (por ejemplo, `-F,` para CSV).

- Puedes definir múltiples instrucciones en una acción con `{ ... ; ... ; }`.

---

¿Quieres ver ejemplos con archivos CSV, o cómo reemplazar `cut`, `grep`, `sed` usando `awk`?
