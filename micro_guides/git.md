# Micro guias de git 

## Hacer un tag completo

``` bash
# Crear un nuevo git tag
git tag -a <Version_control>

# Crear un nuevo git tag con comentario en línea de comandos
git tag -a <Version_control> -m "<comentario>"

# Pushear tags a remoto
git push origin --tags

## Eliminar un fichero que ya se encuentra en "local repository"
git filter-branch --tree-filter 'rm -rf path/to/your/file' HEAD

## Como crear nueva rama a partir de un commit
git branch <nombre_rama> <hash_commit>
```