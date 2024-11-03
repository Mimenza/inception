# Especificamos la imagen base que se va a usar 
FROM debian:bullseye

# Especificamos la ruta del directorio de trabajo
WORKDIR /mariadb

# Actualizamos dependencias y instalamos MariaDB en una sola línea
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copiamos todos los archivos al contenedor
COPY . .

# Exponemos el puerto 3306 para MariaDB
EXPOSE 3306

# Aseguramos que el script de configuración tenga permisos de ejecución
RUN chmod +x mdb-conf.sh

# Usar un usuario no root (opcional)
# RUN useradd -r -s /bin/false mariadbuser
# USER mariadbuser

# El comando por defecto será el script de configuración
CMD ["bash", "mdb-conf.sh"]