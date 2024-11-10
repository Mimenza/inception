#!/bin/bash

# Start the MariaDB service
service mariadb start

# Wait until MariaDB is fully ready
sleep 5

# Create the database and user if they don't already exist
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PWD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%';"
mariadb -e "FLUSH PRIVILEGES;"

# Shutdown MariaDB to apply persistent configurations
mysqladmin --user=root shutdown

# Restart MariaDB in foreground mode to keep the container running
exec mysqld --port=3306 \
            --bind-address=0.0.0.0 \
            --datadir='/var/lib/mysql' \
            --user=mysql
