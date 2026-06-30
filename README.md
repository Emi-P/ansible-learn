# Este README.md Lo escribio opencode, asi que hay boludeces sin sentido
# Laboratorio Ansible

Entorno Docker con múltiples nodos Linux para practicar Ansible.

## Requisitos

- Docker
- Python, para generar un entorno donde instalar ansible facil

## Uso

```bash
# 1. Agregar los nombres al /etc/hosts del host
sudo cp hosts /etc/hosts

# 2. Crear/reciclar el entorno
./generar_entorno.sh

# 3. Copiar la clave SSH a los nodos (se conecta como root)
./copiar_claves.sh

# 4. Probar conexion (resuelve por /etc/hosts)
ssh -i id_ansible -o StrictHostKeyChecking=no root@debian1

# 5. Activar entorno Python con Ansible
source venv/bin/activate
```

## Nodos

| Nombre   | IP           | Imagen                    |
|----------|--------------|---------------------------|
| debian1  | 10.10.0.2   | debian11-ansible          |
| debian2  | 10.10.0.3   | debian11-ansible          |
| rocky1   | 10.10.0.5   | rocky9-ansible            |
| rocky2   | 10.10.0.6   | rocky9-ansible            |
| ubuntu1  | 10.10.0.8   | ubuntu22-ansible          |
| mysql1   | 10.10.0.10  | debian11-ansible          |
| mysql2   | 10.10.0.11  | debian11-ansible          |
| tomcat1  | 10.10.0.12  | debian11-ansible          |
| tomcat2  | 10.10.0.13  | debian11-ansible          |

## Archivos

- `generar_entorno.sh` — destruye y recrea toda la infraestructura Docker
- `copiar_claves.sh` — distribuye `id_ansible.pub` a `/root/.ssh/authorized_keys` en cada nodo
- `id_ansible` / `id_ansible.pub` — par de claves SSH para acceso sin contraseña
- `hosts` — mapeo IP-hostname para `/etc/hosts`
- `maquinas` — lista de nombres de nodos
- `venv/` — entorno virtual con Ansible instalado

# Aclaraciones
PORFAVOR,PORFAVOR,PORFAVOR NO AGREGUES LAS CLAVES AL .ssh DE TU MAQUINA, PORQUE LA ESTAS CAGANDO

Las imagenes no necesariamente son la version ansible, pero ya vienen con el usuario ansible y son comodas para
algunas cosas.
