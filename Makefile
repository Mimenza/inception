# Define la ruta de datos para MariaDB
DB_DATA=$(pwd)/data/mariadb
WP_DATA=$(pwd)/data/wordpress # Reactivamos esta línea

export DB_DATA
export WP_DATA

# objetivo por defecto
all: up

# iniciar el proceso de construcción
# crear el directorio de datos de mariadb.
# iniciar el contenedor en segundo plano y dejarlo en ejecución
up: build
	@mkdir -p $(DB_DATA) # crear el directorio de datos de mariadb
	# @mkdir -p $(WP_DATA) # Se ha comentado la creación del directorio de datos de WordPress
	docker-compose -f srcs/docker-compose.yml up -d --build --remove-orphans
	docker ps
	docker logs mariadb

# detener el contenedor
down:
	docker-compose -f srcs/docker-compose.yml down

# detener el contenedor
stop:
	docker-compose -f srcs/docker-compose.yml stop

# iniciar el contenedor
start:
	docker-compose -f srcs/docker-compose.yml start

# construir el contenedor
build:
	docker-compose -f srcs/docker-compose.yml build

# limpiar los contenedores
# detener todos los contenedores en ejecución y eliminarlos.
# eliminar todas las imágenes, volúmenes y redes.
# eliminar el directorio de datos de mariadb.
# el (|| true) se utiliza para ignorar el error si no hay contenedores en ejecución para evitar que el comando make se detenga.
clean:
	@docker stop $$(docker ps -qa) || true
	@docker rm $$(docker ps -qa) || true
	@docker rmi -f $$(docker images -qa) || true
	@docker volume rm $$(docker volume ls -q) || true
	@docker network rm $$(docker network ls -q) || true
	@rm -rf $(DB_DATA) || true # eliminar el directorio de datos de mariadb

# limpiar y iniciar el contenedor
re: clean up

# limpiar los contenedores: ejecutar el objetivo clean y eliminar todos los contenedores, imágenes, volúmenes y redes del sistema.
prune: clean
	@docker system prune -a --volumes -f
