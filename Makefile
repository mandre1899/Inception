#Images Meta
WP_IMAGE_TAG			:= "wp-image"
WP_INSTANCE_NAME		:= "wp-instance"
WP_IMAGE_PATH			:= "srcs/requirements/wp/."

NGINX_IMAGE_TAG			:= "nginx-image"
NGINX_INSTANCE_NAME		:= "nginx-instance"
NGINX_IMAGE_PATH		:= "srcs/requirements/nginx/."

DB_IMAGE_TAG			:= "mariadb-image"
DB_INSTANCE_NAME		:= "mariadb-instance"
DB_IMAGE_PATH			:= "srcs/requirements/mariadb/."
#Images Meta END

COMPOSE_CMD				:= docker compose
COMPOSE_PATH			:= "srcs/docker-compose.yml"

all: up

build:
	docker build -t $(WP_IMAGE_TAG) $(WP_IMAGE_PATH)
	docker build -t $(NGINX_IMAGE_TAG) $(NGINX_IMAGE_PATH)
	docker build -t $(DB_IMAGE_TAG) $(DB_IMAGE_PATH)

up: build
	$(COMPOSE_CMD) -f $(COMPOSE_PATH) up -d

down:
	$(COMPOSE_CMD) -f $(COMPOSE_PATH) down

clean:
	docker rm $(WP_INSTANCE_NAME)
	docker rm $(NGINX_INSTANCE_NAME)
	docker rm $(WP_INSTANCE_NAME)

fclean:
	docker rmi $(WP_IMAGE_TAG)
	docker rmi $(NGINX_IMAGE_TAG)
	docker rmi $(DB_IMAGE_TAG)
	
