.PHONY: all build up down logs

# Nombre del contenedor
CONTAINER_NAME=maria_db

# Comandos
all: up

up:
	@docker-compose up -d

down:
	@docker-compose down

build:
	@docker-compose build

stop:
	@docker-compose stop

logs:
	@docker-compose logs -f $(CONTAINER_NAME)
