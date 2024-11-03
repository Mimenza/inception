#!/bin/bash

# Inicia el servicio MariaDB
service mariadb start

# Espera hasta que MariaDB esté disponible
until mysqladmin ping --silent; do
    echo "Esperando a que MariaDB esté disponible..."
    sleep 1
done

# Configuración de MariaDB usando variables de entorno
mysql -u root <<-EOSQL
    -- Crear base de datos si no existe
    CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;
    
    -- Crear usuario si no existe y asignar permisos
    CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON \`${MYSQL_DB}\`.* TO \`${MYSQL_USER}\`@'%';
    
    -- Configurar la contraseña del usuario root
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
    
    -- Aplicar cambios
    FLUSH PRIVILEGES;
EOSQL

echo "Base de datos y usuario creados correctamente."