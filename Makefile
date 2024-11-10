up:
	@mkdir -p /home/emimenza/data/
	@mkdir -p /home/emimenza/data/mariadb/
	@mkdir -p /home/emimenza/data/wordpress/
	docker compose -f srcs/docker-compose.yml up --build -d 

down:
	docker compose -f srcs/docker-compose.yml down

stop:
	docker compose -f srcs/docker-compose.yml stop

start:
	docker compose -f srcs/docker-compose.yml start

fclean:
	-docker rm -f `docker ps -aq`
	-docker volume rm -f `docker volume ls -q`
	-docker image rm -f `docker image ls -aq`
	-docker network rm -f `docker network ls -q`
	-docker builder prune --all --force
	sudo rm -rf /home/emimenza/data/wordpress/ /home/emimenza/data/mariadb/
	sudo rm -rf /home/emimenza/data/

re:
	@make --no-print-directory down
	@printf "[DOWN]\n"
	@make --no-print-directory up
	@printf "[UP]\n"
