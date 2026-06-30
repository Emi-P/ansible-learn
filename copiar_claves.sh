#!/bin/bash

CONTENEDORES="debian1 debian2 rocky1 rocky2 ubuntu1 mysql1 mysql2 tomcat1 tomcat2"

for c in $CONTENEDORES; do
    echo "=== $c ==="
    docker exec "$c" bash -c "
        mkdir -p ~/.ssh &&
        chmod 700 ~/.ssh
    "
    docker cp id_ansible.pub "$c:/root/.ssh/authorized_keys"
    docker exec "$c" bash -c "
        chown root:root ~/.ssh/authorized_keys &&
        chmod 600 ~/.ssh/authorized_keys
    "
    echo "  OK"
done

echo "Listo. Probar con:"
echo "ssh -i id_ansible -o StrictHostKeyChecking=no root@10.10.0.2"

