# Micro guias de git 

## Manejo y control de tags
``` bash
# Crear un nuevo git tag
git tag -a <Version_control>

# Crear un nuevo git tag con comentario en línea de comandos
git tag -a <Version_control> -m "<comentario>"

# Pushear tags a remoto
git push origin --tags
```

## Manejo y control de ficheros en diferetnes stages
``` bash
## Eliminar un fichero que ya se encuentra en "local repository"
git filter-branch --tree-filter 'rm -rf path/to/your/file' HEAD
```

## Manejo y control de ramas
```bash
## Como crear nueva rama a partir de un commit
git branch <nombre_rama> <hash_commit>
```