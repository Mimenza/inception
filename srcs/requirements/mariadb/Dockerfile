FROM debian:bullseye

# Update, install MariaDB, and clean up cache
RUN apt update && apt install -y mariadb-server && rm -rf /var/lib/apt/lists/*

# Copy the configuration script to the container
COPY ./conf/mdb_conf.sh /mdb_conf.sh

# Grant execution permissions to the script
RUN chmod +x /mdb_conf.sh

# Expose MariaDB port
EXPOSE 3306

# Use an absolute path in ENTRYPOINT
ENTRYPOINT ["/mdb_conf.sh"]
