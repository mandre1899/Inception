WP_IMAGE_TAG			:= "wp-image"
NGINX_IMAGE_TAG			:= "nginx-image"
DB_IMAGE_TAG			:= "mariadb-image"

COMPOSE_CMD				:= docker compose
COMPOSE_PATH			:= "srcs/docker-compose.yml"

all: up

build:
	

up: build
	$(COMPOSE_CMD) -f $(COMPOSE_PATH) up -d

down:
	$(COMPOSE_CMD) -f $(COMPOSE_PATH) down

clean:
	$(COMPOSE_CMD) -f $(COMPOSE_PATH) down --volumes --remove-orphans
fclean:
	docker rmi $(WP_IMAGE_TAG) $(NGINX_IMAGE_TAG) $(DB_IMAGE_TAG) || true

.PHONY: all build up down clean fclean
