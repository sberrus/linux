# CGROUP
Esta es una caracteristica que nos ofrece el Kernell de Linux que nos permite asignarle recursos jerarquicamente a los procesos.

Es una forma de poder asignarle recursos finitos y que los procesos y los hijos de estos procesos, no puedna coger más recursos.

En un mismo cgroup pueden haber multiples procesos además de otros cgroup.

Entre las cosas que podemos hacer con cgroup serían:

- Definir el consumo máximo de memoria de un grupo.
- Definir el consumo máximo de CPU de un grupo.
- Medir el consumo de los recursos de un grupo.
- Congelar todos los procesos de un grupo.

Estas capacidades que nos ofrece cgroup son realmente útiles sobretodo en los casos en los que tenemos aplicaciones desplegadas en contenedores y queremos limitar el consumo de los mismos para que no canibalicen recursos a otros contenedores o procesos.

Para ver todos los cgroups ocupamos el comando `systemctl status`. Con este comando podemos ver en el campo CGroup de forma jerarquica, todos los Cgroups que existen en el sistema.

