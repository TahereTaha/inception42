
PROJECT_NAME	=	inception

COMPOSE_FILE	=	./srcs/docker-compose.yml
ENV_FILE		=	./srcs/.env
BUILD_ENV_FILE	=	./srcs/.build.env

NGINX_DIR		=	./srcs/requirements/nginx/
MARIADB_DIR		=	./srcs/requirements/mariadb/
WORDPRESS_DIR	=	./srcs/requirements/wordpress/

all: build up

re: clean all

fre: fclean all

#	Build

build:
	cp $(ENV_FILE) $(BUILD_ENV_FILE)
	for file in secrets/* ; do \
		echo -n $$(basename $$file)"=" >> $(BUILD_ENV_FILE); \
		cat $$file | head -n 1 >> $(BUILD_ENV_FILE); \
		echo "" >> $(BUILD_ENV_FILE); \
	done
	cp $(BUILD_ENV_FILE) $(NGINX_DIR)
	cp $(BUILD_ENV_FILE) $(MARIADB_DIR)
	cp $(BUILD_ENV_FILE) $(WORDPRESS_DIR)


#	Utils

up:
	docker compose --file $(COMPOSE_FILE) up -d

stop:
	docker compose --file $(COMPOSE_FILE) stop

down:
	docker compose --file $(COMPOSE_FILE) down

ps:
	docker ps -a

#	Cleanup

clean:
	if docker ps -aq | grep -q '' ; then \
		docker rm -f $$(docker ps -aq); \
	fi
	if docker image ls -aq | grep -q '' ; then \
		docker image rm -f $$(docker image ls -aq); \
	fi
	docker volume prune -af
	rm -rf **/.build.env

fclean: clean
	docker system prune -af
